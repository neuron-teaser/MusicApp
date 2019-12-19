//
//  UIColor+Helper.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var maDarkGray: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maDarkGray")
        } else {
            return UIColor.init(rgb: 0x676767)
        }
    }
    
    static var maGreen: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGreen")
        } else {
            return UIColor.init(rgb: 0x17a98c)
        }
    }
    
    static var maGreenLite: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGreenLite")
        } else {
            return UIColor.init(rgb: 0xbae4db)
        }
    }
    
    static var maLightGray: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maLightGray")
        } else {
            return UIColor.init(rgb: 0xd4d4d4)
        }
    }
    
    static var maPaste: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maPaste")
        } else {
            return UIColor.init(rgb: 0xbae6dd)
        }
    }
    
    static var maDarkGreen: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maDarkGreen")
        } else {
            return UIColor.init(rgb: 0x339582)
        }
    }
    
    static var maGray: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGray")
        } else {
            return UIColor.init(rgb: 0x818484)
        }
    }
    
    static var maPurple: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maPurple")
        } else {
            return UIColor.init(rgb: 0x974480)
        }
    }
    
    static var maLightGrayDeep: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maLightGrayDeep")
        } else {
            return UIColor.init(rgb: 0xbababa)
        }
    }
    
    static var maGold: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGold")
        } else {
            return UIColor.init(rgb: 0xbb930a)
        }
    }
    
    static var maGoldLite: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGoldLite")
        } else {
            return UIColor.init(rgb: 0xfafad2)
        }
    }

    static var maPink: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maPink")
        } else {
            return UIColor.init(rgb: 0xfa636a)
        }
    }
    
    static var maPinkLite: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maPinkLite")
        } else {
            return UIColor.init(rgb: 0xdad4d6)
        }
    }
    
    static var maSeparator: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maSeparator")
        } else {
            return UIColor.init(rgb: 0xcbcbcb)
        }
    }
    
    static var maMegenda: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maMegenda")
        } else {
            return UIColor.init(rgb: 0xdc6285)
        }
    }
    
    static var maMegendaLite: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maMegendaLite")
        } else {
            return UIColor.init(rgb: 0xEFC2CD)
        }
    }
    
    static var maRedText: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maRedText")
        } else {
            return UIColor.init(rgb: 0xeb1d2a)
        }
    }
    
    static var maDeepGray: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maDeepGray")
        } else {
            return UIColor.init(rgb: 0x575964)
        }
    }
    
    static var maLightPurple: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maLightPurple")
        } else {
            return UIColor.init(rgb: 0x8963b0)
        }
    }
    
    static var maFadePurple: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maFadePurple")
        } else {
            return UIColor.init(rgb: 0xe8e0ee)
        }
    }
    
    static var maBrightPurple: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maBrightPurple")
        } else {
            return UIColor.init(rgb: 0xBA55D3)
        }
    }
    
    static var maBrown: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maBrown")
        } else {
            return UIColor.init(rgb: 0x842632)
        }
    }
    
    static var maFadeWhite: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maFadeWhite")
        } else {
            return UIColor.init(rgb: 0xebebeb)
        }
    }
    
    static var maYelloBar: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maYelloBar")
        } else {
            return UIColor.init(rgb: 0xE0DE52)
        }
    }
    
    static var maYellowTitle: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maYellowTitle")
        } else {
            return UIColor.init(rgb: 0xE1EA0F)
        }
    }
    
    static var maGrayBar: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGrayBar")
        } else {
            return UIColor.init(rgb: 0x716B6B)
        }
    }
    
    static var maGreenDeep: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maGreenDeep")
        } else {
            return UIColor.init(rgb: 0x008000)
        }
    }
    
    static var maLinkBlue: UIColor? {
        if #available(iOS 11.0, *) {
            return UIColor(named: "maLinkBlue")
        } else {
            return UIColor.init(rgb: 0x079EF4)
        }
    }

    
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
