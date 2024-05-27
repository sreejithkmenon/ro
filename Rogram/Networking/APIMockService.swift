//
//  APIMockService.swift
//  Rogram
//
//  Created by Sreejith K Menon on 26/05/24.
//

import Foundation

/// `APIMockService` is a mock service used for testing by mimicking network responses.
/// This service conforms to the `APIServiceProtocol`, allowing it to substitute any actual API service during testing.
struct APIMockService: APIServiceProtocol {
    
    // Stores a predefined result which can be either a successful array of `Photo` objects or an error of type `APIError`.
    // This result is returned whenever `fetchPhotos` is called, simulating a network call.
    var resultPhotos: Result<[Photo], APIError>
    
    /// Fetches photos from a mock data source.
    ///
    /// - Parameters:
    ///   - url: The URL to fetch the photos from. In the case of `APIMockService`, this parameter is ignored because
    ///          the result is predetermined and does not depend on the URL.
    ///   - completion: A closure to be called with the result when fetching is complete. This completion handler
    ///                 mimics asynchronous behavior typical of network requests.
    ///
    /// - Note: Since this is a mock implementation, the `url` parameter does not affect the outcome. The outcome
    ///         is determined solely by the `resultPhotos` property of this service. This design is intended for testing
    ///         scenarios where network independence is crucial for consistent results.
    func fetchPhotos(url: URL?, completion: @escaping (Result<[Photo], APIError>) -> Void) {
        completion(resultPhotos)
    }
}

