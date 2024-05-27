//
//  PhotoViewModel.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

/// A view model class for managing the state and fetching of photos in an application.
class PhotoViewModel: ObservableObject {
    
    // MARK: - Properties
    
    /// The list of photos retrieved from the server.
    @Published var photos = [Photo]()
    
    /// A boolean that tracks whether the photos are currently being loaded.
    @Published var isLoading: Bool = false
    
    /// An optional string that stores an error message should an error occur during fetching.
    @Published var errorMessage: String? = nil
    
    /// The service responsible for fetching photos from the API.
    let service: APIServiceProtocol
    
    // MARK: - Initializer
    
    /// Initializes a `PhotoViewModel` instance with an optional API service. If no service is provided,
    /// a default instance of `APIService` is used.
    /// - Parameter service: The service for fetching photos. Defaults to `APIService()`.
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchPhotos()
    }
    
    // MARK: - Methods
    
    /// Fetches photos from a predefined URL and handles the result.
    func fetchPhotos() {
        isLoading = true
        errorMessage = nil
        
        // Define the URL for fetching photos. Assumes a static URL; could be made configurable if needed.
        let url = URL(string: "https://jsonplaceholder.typicode.com/album/1/photos")
        
        // Calls the service to fetch photos, handling the response asynchronously.
        service.fetchPhotos(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    // Handles the error case by setting the loading flag and storing the error message.
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                case .success(let photos):
                    // On success, updates the `photos` property with the fetched photos.
                    self.photos = photos
                }
            }
        }
    }
    
    // MARK: - Static Factory Methods
    
    /// Creates a `PhotoViewModel` in an error state, simulating a failure in fetching photos.
    /// Useful for testing error handling in the UI.
    static func errorState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    /// Creates a `PhotoViewModel` in a success state with example photos.
    /// Useful for UI testing without needing to fetch real data.
    static func successState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.photos = [Photo.example1(), Photo.example2()]
        return fetcher
    }
}
