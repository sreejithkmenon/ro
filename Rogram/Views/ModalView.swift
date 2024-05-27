//
//  ModalView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

/// `ModalView` displays a detailed view of a photo, including a dynamically loaded image and its title.
/// The view uses `AsyncImage` to handle image loading and rendering asynchronously from a URL.
///
/// - Important: This view assumes that `photo.url` is a valid URL string that points to an image resource.
///   If `photo.url` is invalid or the image loading fails, a placeholder image is shown instead.
struct ModalView: View {
    let photo: Photo  // The `Photo` model containing data about the photo to be displayed.
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            AsyncImage(url: URL(string: photo.url)) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()  // Allows the image to resize to fit the container.
                            .scaledToFill()  // Ensures the image fills the available space without losing aspect ratio.
                        Text(photo.title.capitalized)  // Displays the title of the photo, capitalized.
                            .frame(maxWidth: .infinity, alignment: .leading)  // Ensures the text aligns to the left.
                            .bold()  // Makes the text bold.
                            .font(.title)  // Sets the font size to title size.
                            .padding()  // Adds padding around the text.
                    }
                case .failure:
                    Image(systemName: "photo")  // Displays a system icon when image fails to load.
                        .imageScale(.large)  // Increases the size of the placeholder icon.
                        .padding()  // Adds padding around the icon.
                default:
                    ProgressView()  // Shows a loading indicator while the image is being loaded.
                        .padding()  // Adds padding around the progress indicator.
                }
            }
        }
    }
}

/// Provides a preview for `ModalView`.
struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(photo: Photo.example1())
    }
}
