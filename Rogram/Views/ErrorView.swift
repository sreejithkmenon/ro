//
//  ErrorView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 26/05/24.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var photoViewModel = PhotoViewModel()
    
    var body: some View {
        VStack {
            Text("Rogram")
                .font(.largeTitle)
                .bold()
                .padding()
            if let errorMessage = photoViewModel.errorMessage {
                Text(errorMessage)
                    .padding()
            }
            Button {
                photoViewModel.fetchPhotos()
            } label: {
                Text("Try again")
            }
            .padding()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}

