//
//  HomeView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

/// A view representing the home screen of the Rogram application where users can view a list of photos.
///
/// This view uses a `NavigationView` and a `ScrollView` to present a scrollable grid of images.
/// Each image is fetched asynchronously and can be tapped to view in full screen via a modal.
struct HomeView: View {
    /// The array of `Photo` objects that the view uses to display its content.
    let photos: [Photo]
    
    /// State to track the currently selected photo. When a photo is tapped, this state is updated,
    /// triggering the display of a modal view with the selected photo.
    @State var selectedPhoto: Photo?
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    // Loop through the photos array to create image views for each photo
                    ForEach(photos, id: \.self) { photo in
                        // AsyncImage is used to load and display images from a URL asynchronously.
                        AsyncImage(url: URL(string: photo.url)) { phase in
                            switch phase {
                            case .success(let image):
                                VStack(spacing: 0) {
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 350, height: 350)
                                        .onTapGesture {
                                            self.selectedPhoto = photo
                                        }
                                    // Title and favorite icon beneath the image
                                    HStack {
                                        Text(photo.title.capitalized)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .padding()
                                            .foregroundColor(.black)
                                            .bold()
                                        
                                        Image(systemName: "heart.fill")
                                            .padding()
                                            .foregroundColor(.red)
                                            .font(.title2)
                                        
                                    }
                                    .frame(width: 350, height: 80)
                                    .background(Color.white)
                                }
                                .cornerRadius(15)
                                .frame(
                                    minWidth: 0,
                                    maxWidth: .infinity
                                )
                                .shadow(color: .gray, radius: 2)
                            case .failure:
                                // Placeholder image for failures in image loading
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .padding()
                            default:
                                // Display a progress view while the image is loading
                                ProgressView()
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Ro")
        }
        // Modal view presentation when a photo is selected
        .sheet(item: $selectedPhoto) { photo in
            ModalView(photo: photo)
        }
    }
}

/// A preview provider for SwiftUI previews in Xcode that utilizes a predefined set of photos.
struct HomeRogramView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(photos: PhotoViewModel.successState().photos)
    }
}
