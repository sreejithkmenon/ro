//
//  PhotoViewModel.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import Foundation

class PhotoViewModel: ObservableObject {
    
    @Published var photos = [Photo]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchPhotos()
    }
    
    func fetchPhotos() {
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://jsonplaceholder.typicode.com/album/1/photos")
        
        service.fetchPhotos(url: url) { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.isLoading = false
                    self.errorMessage = error.localizedDescription
                case .success(let photos):
                    self.photos = photos
                }
            }
        }
    }
    
    static func errorState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> PhotoViewModel {
        let fetcher = PhotoViewModel()
        fetcher.photos = [Photo.example1(), Photo.example2()]
        return fetcher
    }
}
