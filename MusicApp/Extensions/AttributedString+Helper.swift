//
//  AttributedString+Helper.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import UIKit

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor, font: UIFont = UIFont.systemFont(ofSize: 12)) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttributes([NSAttributedString.Key.font : font, NSAttributedString.Key.foregroundColor : color], range: range)
        //self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
    
    func setFontForText(textForAttribute: String, font: UIFont) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.font, value: font, range: range)
    }
    
}
