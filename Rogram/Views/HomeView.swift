//
//  HomeView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

struct HomeView: View {
    let photos: [Photo]
    @State var selectedPhoto: Photo?
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    ForEach(photos, id: \.self) { photo in
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
                                Image(systemName: "photo")
                                    .imageScale(.large)
                                    .padding()
                            default:
                                ProgressView()
                                    .padding()
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Ro")
        }
        .sheet(item: $selectedPhoto) { photo in
            ModalView(photo: photo)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(photos: PhotoViewModel.successState().photos)
    }
}

