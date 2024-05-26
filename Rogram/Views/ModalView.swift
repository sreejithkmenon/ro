//
//  ModalView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

struct ModalView: View {
    let photo: Photo
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            AsyncImage(url: URL(string: photo.url)) { phase in
                switch phase {
                case .success(let image):
                    VStack {
                        image
                            .resizable()
                            .scaledToFill()
                        Text(photo.title.capitalized)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .bold()
                            .font(.title)
                            .padding()
                    }
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

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(photo: Photo(albumId: 1,
                               id: 1,
                               title: "accusamus beatae ad facilis cum similique qui sunt",
                               url: "https://via.placeholder.com/600/92c952",
                               thumbnailUrl: "https://via.placeholder.com/150/92c952"))
    }
}
