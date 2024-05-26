//
//  APIServiceProtocol.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

protocol APIServiceProtocol {
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void)
}
