//
//  APIError.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

/// `APIError` is an enumeration that defines various types of errors that can occur while interacting with web APIs.
/// It conforms to the `Error` protocol and provides a user-friendly description for each error type.
enum APIError: Error, CustomStringConvertible {
    // MARK: - Cases
    
    /// Represents an error due to an invalid URL.
    case badURL
    
    /// Represents an error from the API server indicated by an unexpected status code.
    /// - Parameter statusCode: The HTTP status code returned from the server.
    case badResponse(statusCode: Int)
    
    /// Represents an error encountered during a URL session.
    /// - Parameter error: An optional `URLError` object containing more details about the error.
    case url(URLError?)
    
    /// Represents a parsing error when decoding data from the API.
    /// - Parameter error: An optional `DecodingError` that provides details about what went wrong during the decoding process.
    case parsing(DecodingError?)
    
    /// Represents an undefined or unknown error.
    case unknown
    
    // MARK: - Properties
    
    /// A user-friendly description of the error intended for display in the UI.
    var localizedDescription: String {
        switch self {
        case .badURL, .parsing, .unknown:
            return "Sorry, something went wrong."
        case .badResponse:
            return "Sorry, the connection to our server failed."
        case .url(let error):
            return error?.localizedDescription ?? "Something went wrong."
        }
    }
    
    /// A description of the error. Conforms to `CustomStringConvertible` for better debug logging.
    var description: String {
        switch self {
        case .unknown:
            return "unknown error"
        case .badURL:
            return "invalid URL"
        case .url(let error):
            return error?.localizedDescription ?? "url session error"
        case .parsing(let error):
            return "parsing error \(error?.localizedDescription ?? "")"
        case .badResponse(statusCode: let statusCode):
            return "bad response with status code \(statusCode)"
        }
    }
}

/// Note:
/// - `localizedDescription` is meant to be used to provide error messages suitable for user-facing interfaces.
/// - `description` is more suitable for debugging and logs, providing a clearer picture of the error nature.
