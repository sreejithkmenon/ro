//
//  APIMockService.swift
//  Rogram
//
//  Created by Sreejith K Menon on 26/05/24.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    var resultPhotos: Result<[Photo], APIError>
    
    func fetchPhotos(url: URL?, completion: @escaping (Result<[Photo], APIError>) -> Void) {
        completion(resultPhotos)
    }
}
