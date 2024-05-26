//
//  Photo.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

struct Photo: Codable, Hashable, Identifiable {
    
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id
        case title
        case url
        case thumbnailUrl
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try values.decode(Int.self, forKey: .albumId)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        thumbnailUrl = try values.decode(String.self, forKey: .thumbnailUrl)
    }
    
    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    static func example1() -> Photo {
        return Photo(albumId: 1,
                     id: 1,
                     title: "accusamus beatae ad facilis cum similique qui sunt",
                     url: "https://via.placeholder.com/600/92c952",
                     thumbnailUrl: "https://via.placeholder.com/150/92c952")
        
    }
    
    static func example2() -> Photo {
        return Photo(albumId: 1,
                     id: 2,
                     title: "reprehenderit est deserunt velit ipsam",
                     url: "https://via.placeholder.com/600/771796",
                     thumbnailUrl: "https://via.placeholder.com/150/771796")
        
    }
}
