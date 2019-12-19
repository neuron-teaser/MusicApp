//
//  APIEndPoints.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

//MARK:- Data Pack
enum MusicDataEndPoint: MAEndpoint {
    
    case GetData(termName: String)
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    var method: HTTPMethod {
        switch self {
        case .GetData:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .GetData(let termName):
            return KBasePath + OauthPath.search.rawValue + "?term=" + termName
        }
    }
    
    var query: [String: Any]  {
        switch self {
        case .GetData:
            return [String: Any]()
        
        }
    }
}
