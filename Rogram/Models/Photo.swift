//
//  Photo.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

/// `Photo` represents a photo entity with several attributes including its own unique identifiers and associated URLs.
struct Photo: Codable, Hashable, Identifiable {
    let albumId: Int        // Unique identifier for the album to which the photo belongs
    let id: Int             // Unique identifier for the photo
    let title: String       // Title of the photo
    let url: String         // URL of the photo image
    let thumbnailUrl: String // URL of the photo's thumbnail image
    
    /// Coding keys to map JSON properties to the Swift struct properties.
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"  // Maps `albumId` from JSON to `albumId` in the struct
        case id                   // Maps `id` from JSON to `id` in the struct
        case title                // Maps `title` from JSON to `title` in the struct
        case url                  // Maps `url` from JSON to `url` in the struct
        case thumbnailUrl         // Maps `thumbnailUrl` from JSON to `thumbnailUrl` in the struct
    }
    
    /// Initializes a new instance of `Photo` from a decoder.
    /// - Throws: `DecodingError` if any required fields are missing or if there is a type mismatch.
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try values.decode(Int.self, forKey: .albumId)
        id = try values.decode(Int.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        url = try values.decode(String.self, forKey: .url)
        thumbnailUrl = try values.decode(String.self, forKey: .thumbnailUrl)
    }
    
    /// Custom initializer to create a `Photo` instance directly with specified values.
    init(albumId: Int, id: Int, title: String, url: String, thumbnailUrl: String) {
        self.albumId = albumId
        self.id = id
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    /// Provides an example instance of `Photo`.
    static func example1() -> Photo {
        return Photo(albumId: 1,
                     id: 1,
                     title: "accusamus beatae ad facilis cum similique qui sunt",
                     url: "https://via.placeholder.com/600/92c952",
                     thumbnailUrl: "https://via.placeholder.com/150/92c952")
    }
    
    /// Provides another example instance of `Photo`.
    static func example2() -> Photo {
        return Photo(albumId: 1,
                     id: 2,
                     title: "reprehenderit est deserunt velit ipsam",
                     url: "https://via.placeholder.com/600/771796",
                     thumbnailUrl: "https://via.placeholder.com/150/771796")
    }
}
