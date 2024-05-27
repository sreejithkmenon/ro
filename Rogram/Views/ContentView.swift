//
//  ContentView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//
//  This file contains the ContentView structure which acts as the entry point for the SwiftUI view hierarchy
//  of the Rogram application. ContentView is responsible for orchestrating the different view states such as
//  loading, error, and the display of fetched photos.
//
//  The ContentView utilizes a view model (`PhotoViewModel`) to manage its state, reacting to changes
//  in loading status, error messages, and the photos data.
//
//  Import necessary SwiftUI framework.
import SwiftUI

/// A SwiftUI view that serves as the main container for displaying either a loading view, an error view, or the home view
/// containing a list of photos, depending on the state of the photo content being managed by `PhotoViewModel`.
struct ContentView: View {
    // MARK: - Properties
    
    /// The view model object responsible for managing photo data. It is observed for any changes to reflect
    /// updates in the UI automatically.
    @StateObject private var photoViewModel = PhotoViewModel()
    
    // MARK: - View Configuration
    
    /// The body property of ContentView which constructs the user interface. Depending on the state of `photoViewModel`,
    /// it displays a `LoadingView`, `ErrorClick to add more details and examplesView`, or `HomeView`.
    var body: some View {
        VStack {
            // Display a loading spinner when data is being fetched.
            if photoViewModel.isLoading {
                LoadingView()
            }
            // Display an error message if fetching of data fails.
            else if photoViewModel.errorMessage != nil  {
                ErrorView(photoViewModel: photoViewModel)
            }
            // Display the home view with photos once the data is successfully fetched.
            else {
                 HomeView(photos: photoViewModel.photos)
            }
        }
    }
}

/// A preview provider that contains a preview of ContentView. This is particularly useful for design and layout
/// testing in Xcode's canvas without needing to run the app on a simulator or device.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
