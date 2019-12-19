//
//  UIAlertController+Show.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//


import UIKit


extension UIAlertController {
    
    func show() {
        if let visibleViewController = UIApplication.shared.keyWindow?.visibleViewController() {
            DispatchQueue.main.async(execute: {
                visibleViewController.present(self, animated: true, completion: nil)
            })
        } else {
            //DLog("Can not show AlertController As there is no visibleViewController")
        }
    }
    
}

