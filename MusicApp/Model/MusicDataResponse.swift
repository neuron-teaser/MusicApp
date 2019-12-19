//
//  MusicDataResponse.swift
//  MusicApp
//
//  Created by Jamil Bin Hossain on 17/12/19.
//  Copyright © 2019 Jamil Bin Hossain. All rights reserved.
//

import Foundation
import ObjectMapper

struct MusicDataResponse: Mappable {
    
    var musicDataArray:[MusicObject]?
    var musicResultCount: Int?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        musicDataArray <- map["results"]
        musicResultCount <- map["resultCount"]
    }
}

struct MusicObject: Mappable {
    
    var wrapperType: String?
    var kind: String?
    var collectionId: Int32?
    var trackId: Int32?
    var artistName: String?
    var collectionName: String?
    var trackName: String?
    var collectionCensoredName: String?
    var trackCensoredName: String?
    var collectionArtistId: Int32?
    var collectionArtistViewUrl: String?
    var collectionViewUrl: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var collectionPrice: Double?
    var trackPrice: Double?
    var collectionHdPrice: Double?
    var trackHdPrice: Double?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var discCount: Int?
    var trackCount: Int?
    var trackNumber: Int?
    var trackTimeMillis: Int32?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var contentAdvisoryRating: String?
    var longDescription: String?
    var hasITunesExtras: Bool?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        
        wrapperType <- map["wrapperType"]
        kind <- map["kind"]
        collectionId <- map["collectionId"]
        trackId <- map["trackId"]
        artistName <- map["artistName"]
        collectionName <- map["collectionName"]
        trackName <- map["trackName"]
        collectionCensoredName <- map["collectionCensoredName"]
        trackCensoredName <- map["trackCensoredName"]
        collectionArtistId <- map["collectionArtistId"]
        collectionArtistViewUrl <- map["collectionArtistViewUrl"]
        collectionViewUrl <- map["collectionViewUrl"]
        trackViewUrl <- map["trackViewUrl"]
        previewUrl <- map["previewUrl"]
        artworkUrl30 <- map["artworkUrl30"]
        artworkUrl60 <- map["artworkUrl60"]
        artworkUrl100 <- map["artworkUrl100"]
        collectionPrice <- map["collectionPrice"]
        trackPrice <- map["trackPrice"]
        collectionHdPrice <- map["collectionHdPrice"]
        trackHdPrice <- map["trackHdPrice"]
        releaseDate <- map["releaseDate"]
        collectionExplicitness <- map["collectionExplicitness"]
        trackExplicitness <- map["trackExplicitness"]
        discCount <- map["discCount"]
        trackCount <- map["trackCount"]
        trackNumber <- map["trackNumber"]
        trackTimeMillis <- map["trackTimeMillis"]
        country <- map["country"]
        currency <- map["currency"]
        primaryGenreName <- map["primaryGenreName"]
        contentAdvisoryRating <- map["contentAdvisoryRating"]
        longDescription <- map["longDescription"]
        hasITunesExtras <- map["hasITunesExtras"]
              
        
    }
}
