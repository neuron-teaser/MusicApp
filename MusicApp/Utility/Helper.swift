//
//  Helper.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import UIKit
import Locksmith

struct Helper{
    
    static var deviceID: String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static var appVersion: String {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else { return "N/A" }
        return version
    }
    
    static var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    static func emptyMessageInTableView(_ tableView: UITableView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        tableView.backgroundView = noDataLabel
        tableView.separatorStyle = .none
        noDataLabel.text = title
    }
    
    static func emptyMessageInCollectionView(_ collectionView: UICollectionView,_ title: String){
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collectionView.bounds.size.width, height: collectionView.bounds.size.height))
        noDataLabel.textColor        = .lightGray
        noDataLabel.font             = UIFont(name: "Open Sans", size: 15)
        noDataLabel.textAlignment    = .center
        collectionView.backgroundView = noDataLabel
        //        collectionView.separatorStyle = .none
        noDataLabel.text = title
    }
    
    static func setupNavConstraint(topConstraint top: NSLayoutConstraint, heightConstraint height: NSLayoutConstraint) {
        
        if DeviceType.IS_IPAD {
            // No fucking idea, why we need this.. but it solves the problems... for navigation height..
            let delta: CGFloat = DeviceType.IS_IPAD_PRO ? 130 : 85
            top.constant = -delta
            height.constant = height.constant + delta
        } else {
            if #available(iOS 11.0, *) {
                let delta: CGFloat = DeviceType.IS_IPHONE_X ? 45 : 20
                top.constant = -delta
                height.constant = height.constant + delta
            }
        }
        
    }
    
    static var isIntroShown: Bool {
        return UserDefaults.standard.bool(forKey: Constants.isIntroShown)
    }
    
    static var isLoggedIn: Bool {
        return UserDefaults.standard.bool(forKey: Constants.isLoggedIn)
    }
    
    static func setLoggedInToFalse() {
        UserDefaults.standard.set(false, forKey: Constants.isLoggedIn)
        UserDefaults.standard.synchronize()
        UserDefaults.standard.set(true, forKey: Constants.justSignedOut)
        UserDefaults.standard.synchronize()
    }
    
    static func saveUnlimitedPack(with flag: Bool) {
        UserDefaults.standard.set(flag, forKey: Constants.isUnlimitedFnF)
        UserDefaults.standard.synchronize()
    }
    
    static func saveAccessToken(header:String, completion:((Bool) -> Void)) {
        do{
            if Locksmith.loadDataForUserAccount(userAccount: KeyCahinKey.USER_ACCOUNT) == nil {
                try Locksmith.saveData(data: [Constants.headerToken:header], forUserAccount: KeyCahinKey.USER_ACCOUNT)
            } else {
                try Locksmith.updateData(data: [Constants.headerToken:header], forUserAccount: KeyCahinKey.USER_ACCOUNT)
            }
            UserDefaults.standard.set(true, forKey: Constants.isLoggedIn)
            UserDefaults.standard.synchronize()
            completion(true)
        }
        catch {
            //DLog("Unable to store token in Keychain")
            setLoggedInToFalse()
            completion(false)
        }
    }
    
    static func showCommingSoonAlert(from vc:UIViewController) {
        let alertController = UIAlertController(title: "Comming Soon", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        vc.present(alertController, animated: true, completion: nil)
    }
    
    static func showInternetUnreachable() {
        let alertVC = UIAlertController(title: "Internet Connection Not Available", message: "Please Enable Your Wifi Or Cellular Network", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertVC.addAction(okAction)
        alertVC.show()
    }
    
    static func addAsChildVC(_ childVC: UIViewController, to containerView: UIView, with parentVC: UIViewController) {
        childVC.view.translatesAutoresizingMaskIntoConstraints = false
        parentVC.addChild(childVC)
        addSubview(subView: childVC.view, toView: containerView)
        childVC.didMove(toParent: parentVC)
    }
    
    static private func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        subView.backgroundColor = UIColor.clear
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    static func removeAsChildVC(childVC: UIViewController) {
        childVC.willMove(toParent: nil)
        childVC.view.removeFromSuperview()
        childVC.removeFromParent()
    }
    
    static func megaByteConversion(value:Double) -> (Double, String) {
        var convertedValue = value
        var multiplyFactor = 0;
        
        let tokens = ["MB", "GB"]
        
        while (convertedValue >= 1024) {
            convertedValue /= 1024;
            multiplyFactor += 1
        }
        return (convertedValue, tokens[multiplyFactor])
    }
    
    static func minuteConversion(value:Double,isCapital:Bool) -> (Double, String) {
        let minute = value/60
        var unit = ""
        if(isCapital){
            unit = "MINS"
        }else{
            unit = "mins"
        }
        return (minute, unit)
    }
    
    static func isAirtelNum(_ num:String?) -> (Bool,String) {
        guard var phnNum = num else {return (false,"")}
        phnNum = phnNum.replacingOccurrences(of: "\\p{Cf}", with: "", options: .regularExpression)
        let comparablePhnNum: String
        if !phnNum.hasPrefix("88") && !phnNum.hasPrefix("+88") {
            comparablePhnNum = "88" + phnNum
        } else {
            comparablePhnNum = phnNum
        }
        if  comparablePhnNum.hasPrefix("88018") || comparablePhnNum.hasPrefix("+88018") || comparablePhnNum.hasPrefix("88016") || comparablePhnNum.hasPrefix("+88016") || comparablePhnNum.hasPrefix("88015") || comparablePhnNum.hasPrefix("+88015") || comparablePhnNum.hasPrefix("88017") || comparablePhnNum.hasPrefix("+88017") ||
            comparablePhnNum.hasPrefix("88013") || comparablePhnNum.hasPrefix("+88013") ||
            comparablePhnNum.hasPrefix("88019") || comparablePhnNum.hasPrefix("+88019")  {
            let refactoredNum: String
            if comparablePhnNum.hasPrefix("+") {
                refactoredNum = String(comparablePhnNum.dropFirst(1))
            } else {
                refactoredNum = comparablePhnNum
            }
            if refactoredNum.count == 13 {
                return (true,refactoredNum)
            } else {
                showInvalidNumAlert()
                return (false,"")
            }
            
        } else {
            showInvalidNumAlert()
            return (false,"")
        }
    }
    
    static func isValidNumber(_ num:String?) -> (Bool,String){
        guard let phnNum = num else {return (false,"")}
        let comparablePhnNum: String
        if !phnNum.hasPrefix("88") && !phnNum.hasPrefix("+88") {
            comparablePhnNum = "88" + phnNum
        } else {
            comparablePhnNum = phnNum
        }
        
        if (comparablePhnNum.count == 13 && (!comparablePhnNum.hasPrefix("8800") && !comparablePhnNum.hasPrefix("+8800"))) {
            return (true,comparablePhnNum)
        } else {
            showInvalidAlert()
            return (false,"")
        }
    }
    
    private static func showInvalidAlert() {
        let alertCntrl = UIAlertController(title: "Invalid Phone Number", message: "Please enter valid number", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertCntrl.addAction(okAction)
        alertCntrl.show()
    }
    
    private static func showInvalidNumAlert() {
        let alertCntrl = UIAlertController(title: "Invalid Phone Number", message: "Please enter valid airtel number", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertCntrl.addAction(okAction)
        alertCntrl.show()
    }
    
    static func getFormatedImgWithBaseStrAndName(_ images:[UIImage]) -> (UIImage?, String?, String?) {
        guard images.count > 0 else { return (nil,nil,nil)}
        guard let image = images.first else {return (nil,nil, nil)}
        guard let imageData = Helper.getCompressedImgData(image) else {return (nil,nil,nil)}
        let timeStamp = String(Date().ticks)
        let base64StrForAPI = "data:image/jpg;base64," + imageData.base64EncodedString()
        return (UIImage(data: imageData), base64StrForAPI, timeStamp)
    }
    
    private static func getCompressedImgData(_ image:UIImage) -> Data? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return nil}
        let bytes = imageData.count
        let KB = Double(bytes) / 1024.0 // Note the difference
        let MB = KB/1024
        //DLog("Image Size KB = \(KB), MB = \(MB)")
        return imageData
    }
    
    static func getAppVersion() -> String {
        return "\(Bundle.main.infoDictionary!["CFBundleShortVersionString"] ?? "")"
    }
    
    static func openCustomURLScheme(appScheme: String) -> Bool {
        let customURLScheme = appScheme + "://"
        guard let customURL = URL(string: customURLScheme) else {return false}
        if UIApplication.shared.canOpenURL(customURL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(customURL)
            } else {
                UIApplication.shared.openURL(customURL)
            }
            return true
        }
        
        return false
    }
    
    static func isOpenCustomURLScheme(appScheme: String) -> Bool {
        let customURLScheme = appScheme + "://"
        guard let customURL = URL(string: customURLScheme) else {return false}
        return UIApplication.shared.canOpenURL(customURL)
    }
    
    static func openAppURL(with urlStr:String) {
        guard let customURL = URL(string: urlStr) else {return}
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(customURL)
        } else {
            UIApplication.shared.openURL(customURL)
        }
    }
    
    static func openFbAppURL(with pageId:String?, groupId:String?) {
        guard let customPageId = URL(string: "fb://profile/"+pageId!) else {return}
        guard let customGroupId = URL(string: "https://www.facebook.com/"+groupId!) else {return}
        
        if #available(iOS 10.0, *) {
            if UIApplication.shared.canOpenURL(customPageId) {
                //install fb apps
                UIApplication.shared.open(customPageId, options: [:])
            } else {
                UIApplication.shared.open(customGroupId, options: [:])
            }
        } else {
            if UIApplication.shared.canOpenURL(customPageId) {
                //install fb apps
                UIApplication.shared.openURL(customPageId)
            } else {
                UIApplication.shared.openURL(customGroupId)
            }
        }
    }
    
}
