//
//  APIService.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

/// `APIService` is responsible for managing network API requests conforming to `APIServiceProtocol`.
/// It provides methods to fetch generic decodable data and specifically handles fetching a list of photos.
struct APIService: APIServiceProtocol {
    
    /// Fetches data from a URL and decodes it into a specified Decodable type.
    /// - Parameters:
    ///   - type: The type of the model to decode from the received JSON data. Must conform to Decodable.
    ///   - url: The URL to fetch data from. If nil, results in `APIError.badURL`.
    ///   - completion: The completion handler to call when the fetch operation is complete. Returns a Result of type T or APIError.
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T, APIError>) -> Void) {
        // Guard against nil URL which is not expected in a typical fetch request.
        guard let url = url else {
            completion(Result.failure(APIError.badURL))
            return
        }
        
        // Create a URLSession data task to retrieve data from the network.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle networking error (e.g., no internet connection).
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            // Check for HTTP errors in the response.
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            // Attempt to decode the data if available.
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                } catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        // Start the network task.
        task.resume()
    }
    
    /// Fetches an array of Photos from a URL and decodes them.
    /// - Parameters:
    ///   - url: The URL to fetch the photos from. If nil, results in `APIError.badURL`.
    ///   - completion: The completion handler to call when the fetch operation is complete. Returns a Result containing an array of Photos or APIError.
    func fetchPhotos(url: URL?, completion: @escaping(Result<[Photo], APIError>) -> Void) {
        // Guard against nil URL which is an unexpected condition for fetching photos.
        guard let url = url else {
            completion(Result.failure(APIError.badURL))
            return
        }
        
        // Create a URLSession data task similar to the generic fetch method.
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            } else if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            } else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let photos = try decoder.decode([Photo].self, from: data)
                    completion(Result.success(photos))
                } catch {
                completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        
        // Start the network task.
        task.resume()
    }
}
