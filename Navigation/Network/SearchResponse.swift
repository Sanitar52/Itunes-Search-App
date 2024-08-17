//
//  SearchResponse.swift
//  ItunesSearchExample
//
//  Created by Finartz on 19.07.2024.
//

import Foundation

struct SearchResponse: Codable {
    let searchCount: Int?
    let results: [ResultData]
}
struct ResultData: Codable {
    let artistName: String?
    let collectionName: String?
    let artistViewUrl: String?
    let artworkUrl100: String?
    let collectionPrice: Double?

}

//{
//            "wrapperType": "track",
//            "kind": "song",
//            "artistId": 159260351,
//            "collectionId": 1440913923,
//            "trackId": 1440914010,
//            "artistName": "Taylor Swift",
//            "collectionName": "Taylor Swift (Bonus Track Version)",
//            "trackName": "Our Song",
//            "collectionCensoredName": "Taylor Swift (Bonus Track Version)",
//            "trackCensoredName": "Our Song",
//            "artistViewUrl": "https://music.apple.com/us/artist/taylor-swift/159260351?uo=4",
//            "collectionViewUrl": "https://music.apple.com/us/album/our-song/1440913923?i=1440914010&uo=4",
//            "trackViewUrl": "https://music.apple.com/us/album/our-song/1440913923?i=1440914010&uo=4",
//            "previewUrl": "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview211/v4/5c/f3/b9/5cf3b960-a9b0-cba9-33e5-b3131772e824/mzaf_5736754108227620654.plus.aac.p.m4a",
//            "artworkUrl30": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/32/b5/6b/32b56b49-0075-7128-e6ec-7c3c4c697242/00843930000821.rgb.jpg/30x30bb.jpg",
//            "artworkUrl60": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/32/b5/6b/32b56b49-0075-7128-e6ec-7c3c4c697242/00843930000821.rgb.jpg/60x60bb.jpg",
//            "artworkUrl100": "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/32/b5/6b/32b56b49-0075-7128-e6ec-7c3c4c697242/00843930000821.rgb.jpg/100x100bb.jpg",
//            "collectionPrice": 9.99,
//            "trackPrice": 1.29,
//            "releaseDate": "2006-10-24T12:00:00Z",
//            "collectionExplicitness": "notExplicit",
//            "trackExplicitness": "notExplicit",
//            "discCount": 1,
//            "discNumber": 1,
//            "trackCount": 15,
//            "trackNumber": 11,
//            "trackTimeMillis": 201107,
//            "country": "USA",
//            "currency": "USD",
//            "primaryGenreName": "Country",
//            "isStreamable": true
//        },
