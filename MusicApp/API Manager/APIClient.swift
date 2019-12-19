//
//  APIClient.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import Locksmith

public enum Result<T> {
    case success(T)
    case failure(ErrorResponse)
}

typealias CompletionHandler<T> = (Result<T>) -> ()
public typealias ErrorResponse = (Int, Data?, Error)
typealias SocialCompletion = (HTTPURLResponse) -> ()

class APIClient {
    
    //static let shared = APIClient()
    private static var privateShared : APIClient?
    
    class var shared: APIClient {
        guard let uwShared = privateShared else {
            privateShared = APIClient()
            return privateShared!
        }
        return uwShared
    }
    
    class func destroy() {
        privateShared = nil
    }
    
    deinit {
        //DLog("deinit singleton")
    }
    
    private let sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        // look out for bellow... may cause error...
        configuration.timeoutIntervalForRequest = 62 //second as in backend it's 60
        configuration.timeoutIntervalForResource = 62 //second as in backend it's 60
        
        return SessionManager(configuration: configuration)
    }()
    
//    private init() {
//        sessionManager.retrier = OAuth2Handler()
//    }
    
    private let preLogHeaders = ["platform" : "ios", "deviceid" : Helper.deviceID, "appname" : "musicapp", "appversion" : Helper.appVersion]
    
    private var saHeaders: [String:String]? {
        let isSecondary = UserDefaults.standard.bool(forKey: Constants.isSecondary)
        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: KeyCahinKey.USER_ACCOUNT) else {return preLogHeaders}
        guard let token = dictionary[Constants.headerToken] as? String else {return nil}
        if isSecondary {
            guard let userAccount = Locksmith.loadDataForUserAccount(userAccount: KeyCahinKey.USER_ACCOUNT, inService: KeyCahinKey.SERVICE) else {return nil}
            guard let msisdn = userAccount[Constants.userMsisdn] as? String else {return nil}
            return ["token" :  token, "secondary-msisdn" : msisdn].merging(preLogHeaders) {$1}
        } else {
            return ["token" :  token].merging(preLogHeaders) {$1}
        }
    }
    
    private var saPrimaryHeaders: [String:String]? {
        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: KeyCahinKey.USER_ACCOUNT) else {return nil}
        guard let token = dictionary[Constants.headerToken] as? String else {return nil}
        return ["token" :  token].merging(preLogHeaders) {$1}
    }
    
    func objectAPICall<T: Mappable>(apiEndPoint: MAEndpoint, modelType: T.Type, completion: @escaping CompletionHandler<T>) {
        sessionManager.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: nil)
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<T>) in
            
            switch response.result {
            case .success(let value):
                completion(Result.success(value))
            case .failure(let error):
                //DLog(error.localizedDescription)
                guard let statusCode = response.response?.statusCode else {
                    let unKnownError = ErrorResponse(-999, response.data, error)
                    completion(Result.failure(unKnownError))
                    return
                }
                let mError = ErrorResponse(statusCode, response.data, error)
                completion(Result.failure(mError))
            }
        }
    }
    
    
    func secondaryAccAPICall<T: Mappable>(apiEndPoint: MAEndpoint, modelType: T.Type, completion: @escaping CompletionHandler<T>) {
        
        sessionManager.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: saPrimaryHeaders)
            .validate(statusCode: 200..<300)
            .responseObject { (response: DataResponse<T>) in
            
            switch response.result {
            case .success(let value):
                completion(Result.success(value))
            case .failure(let error):
                //DLog(error.localizedDescription)
                guard let statusCode = response.response?.statusCode else {
                    let unKnownError = ErrorResponse(-999, response.data, error)
                    completion(Result.failure(unKnownError))
                    return
                }
                let mError = ErrorResponse(statusCode, response.data, error)
                completion(Result.failure(mError))
            }
        }
    }
    
    func makeAPICall(apiEndPoint: MAEndpoint, completion: @escaping CompletionHandler<Any>) {
        Alamofire.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: saHeaders)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(Result.success(value))
                case .failure(let error):
                    //DLog(error.localizedDescription)
                    guard let statusCode = response.response?.statusCode else {
                        let unKnownError = ErrorResponse(-999, response.data, error)
                        completion(Result.failure(unKnownError))
                        return
                    }
                    let mError = ErrorResponse(statusCode, response.data, error)
                    completion(Result.failure(mError))
                }
        }
    }
    
    func loginAPICall(apiEndPoint: MAEndpoint, completion: @escaping CompletionHandler<Any>) {
        Alamofire.request(apiEndPoint.path, method: apiEndPoint.method, parameters: apiEndPoint.query, encoding: apiEndPoint.encoding, headers: preLogHeaders)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    completion(Result.success(value))
                case .failure(let error):
                    //DLog(error.localizedDescription)
                    guard let statusCode = response.response?.statusCode else {
                        let unKnownError = ErrorResponse(-999, response.data, error)
                        completion(Result.failure(unKnownError))
                        return
                    }
                    let mError = ErrorResponse(statusCode, response.data, error)
                    completion(Result.failure(mError))
                }
        }
    }
    
    func downloadPDF(url: URL, optionalFileName name: String, progress: @escaping ((Double) -> Void), completion: @escaping ((Bool,URL?) -> Void)) {
        let destination: DownloadRequest.DownloadFileDestination = { (temporaryURL, response) in
            let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileName = response.suggestedFilename ?? name
            let file = directoryURL.appendingPathComponent(fileName, isDirectory: false)
            //DLog("Given file Path = \(file)")
            return (file, [.createIntermediateDirectories, .removePreviousFile])
        }
        
        Alamofire.download(
            url, method: .get, headers: saHeaders, to: destination)
            .downloadProgress(closure: { (dwnldProgress) in
                progress(dwnldProgress.fractionCompleted)
            }).response(completionHandler: { (dwnldResponse) in
                if let givnUrl = dwnldResponse.destinationURL {
                    //DLog("Given URL = \(givnUrl)")
                    completion(true, givnUrl)
                } else {
                    completion(false, nil)
                }
            })
        
    }
}






