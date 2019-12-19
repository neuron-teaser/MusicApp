//
//  Date+Helper.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import Foundation

extension Date {
    
    var currentUTCTimeZoneDateString: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
        return formatter.string(from: self)
    }
    
    var ticks: UInt64 {
        return UInt64((self.timeIntervalSince1970 + 62_135_596_800) * 10_000_000)
    }
    
}
