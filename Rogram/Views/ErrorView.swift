//
//  ErrorView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 26/05/24.
//

import SwiftUI

/// A view that handles the error state within the application.
///
/// This view displays a generic error message when something goes wrong with the photo fetching process.
/// It offers the user the ability to retry fetching photos by pressing a button.
///
/// Assumptions:
/// - `PhotoViewModel` manages the photo fetching logic and handles errors internally.
/// - An error message is present in `PhotoViewModel` if something goes wrong during the fetch process.
/// - The `fetchPhotos` method in `PhotoViewModel` will attempt to fetch the photos again when invoked.
struct ErrorView: View {
    /// An instance of `PhotoViewModel` observed for changes to display in the UI.
    @ObservedObject var photoViewModel = PhotoViewModel()
    
    var body: some View {
        VStack {
            Text("Rogram")
                .font(.largeTitle)
                .bold()
                .padding()
            // Displays an error message if available in the `photoViewModel`.
            if let errorMessage = photoViewModel.errorMessage {
                Text(errorMessage)
                    .padding()
            }
            Button {
                // Initiates a photo fetching process when the button is tapped.
                photoViewModel.fetchPhotos()
            } label: {
                Text("Try again")
            }
            .padding()
        }
    }
}

/// A preview provider that constructs a preview of `ErrorView`.
///
/// This preview is useful for seeing the layout and functionality of the view within Xcode's canvas or the SwiftUI Previews feature.
struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
