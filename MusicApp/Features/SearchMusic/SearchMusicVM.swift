//
//  SearchMusicVM.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 18/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import Foundation
import SVProgressHUD
import SwiftyJSON

class SearchMusicVM {
    
    
    func searchMusic(with term:String, completion: @escaping ((Bool)->Void)) {
        
        let searchMusicEndPoint = MusicDataEndPoint.GetData(termName: term)
        
        print("Endpoint Came Here: \(searchMusicEndPoint)")
        
        APIClient.shared.objectAPICall(apiEndPoint: searchMusicEndPoint, modelType: MusicObject.self) { (result) in
         
            
            switch result {
            case .success(let musicInfoResponse):

                guard let artistName = musicInfoResponse.artistName, let artWork = musicInfoResponse.artworkUrl30   else {

                    return
                }
                
                print("Music Artist Name: \(artistName) ,Music Art Work Url: \(artWork) ") // Need This Values
                
                
                completion(true)
                SVProgressHUD.dismiss()
                
            case .failure(_, _, let error):
                //DLog(error.localizedDescription)
                //let messageBlock = jsonData["no_results"].array?.first
                //let reason:String = messageBlock?["detail"].string ?? "Some Unknown Problem Occured"
                //SVProgressHUD.dismiss()
                //SVProgressHUD.showError(withStatus: reason)
                completion(false)
                SVProgressHUD.dismiss()
            }
        }
    }
    
}
