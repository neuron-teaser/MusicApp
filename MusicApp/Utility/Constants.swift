//
//  Constants.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import UIKit

let IS_IPHONE_X = (UIScreen.main.nativeBounds.height == 2436)
let BDT_SYMBOL = "৳ "

let Max_SecondaryAccNum = 4

struct Constants {
    static let headerToken      = "headerToken"
    static let isLoggedIn       = "isLoggedIn"
    static let isIntroShown     = "isIntroShown"
    static let userPhoneNumber  = "user_phone_number"
    static let userName         = "username"
    static let userNickName     = "userNickName"
    static let userMsisdn       = "userPhnNum"
    static let userMsisdnType   = "userMsisdnType"
    static let userEmail        = "userEmail"
    static let userLoyalty      = "userLoyalty"
    static let userAddress      = "userAddress"
    static let isSecondary      = "isSecondary"
    static let isNewUser        = "isNewUser"
    static let avatar           = "avatar"
    static let justSignedOut    = "justSignedOut"
    static let isUnlimitedFnF   = "isUnlimitedFnF"
}

struct KeyCahinKey {
    #if DEVELOPMENT
    static let SERVICE = "MyAirtelSingleAppDev"
    static let USER_ACCOUNT = "AirtelAccountDev"
    static let PRIMARY_ACCOUNT = "PrimaryAirtelAccountDev"
    #else
    static let SERVICE = "MyAirtelSingleApp"
    static let USER_ACCOUNT = "AirtelAccount"
    static let PRIMARY_ACCOUNT = "PrimaryAirtelAccount"
    #endif
}

struct AlertMessages {
    static let insufficient_balance = "Insufficient Account Balance"
    static let alertSuccessMsg = "Your request is under process. You will be notified through SMS shortly."
}





