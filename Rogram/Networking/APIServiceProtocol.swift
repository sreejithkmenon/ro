//
//  APIServiceProtocol.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

/// Protocol defining the requirements for an API service that fetches photo data.
///
/// This protocol ensures that any conforming class will provide a method to fetch photos from a specified URL.
/// It utilizes modern Swift features such as Generics and the Result type for robust error handling.
protocol APIServiceProtocol {
    /// Fetches a list of photos from a given URL and returns the result asynchronously.
    ///
    /// This method expects an optional URL from which to fetch the photos. The optional nature of the URL allows
    /// for flexibility in implementations that might not require a URL for fetching photos (e.g., fetching from cache).
    ///
    /// - Parameters:
    ///   - url: The URL from which to fetch the photos. Can be nil if the photos can be retrieved from a local or cached source.
    ///   - completion: A completion handler that is called when the fetch operation is complete.
    ///                 This handler delivers either an array of `Photo` objects on success or an `API timeError` on failure.
    ///
    /// - Important:
    ///     - The method must handle all network-related errors internally and wrap them into the `APIError` type before calling the completion handler.
    ///     - This is an asynchronous function and may be called on any thread. Ensure that any UI updates based on the completion handler are dispatched to the main queue.
    ///
    /// - Assumptions:
    ///   - The URL provided is well-formed and points to a valid endpoint. If `nil`, it is assumed the implementation knows alternative means of fetching the photos.
    ///   - The consumer of this API is responsible for ensuring that the URL is correct and that any required permissions for accessing the URL are handled prior to fetching.
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void)
}

