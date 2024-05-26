//
//  ContentView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var photoViewModel = PhotoViewModel()
    
    var body: some View {
        VStack {
            if photoViewModel.isLoading {
                LoadingView()
            }
            else if photoViewModel.errorMessage != nil  {
                ErrorView(photoViewModel: photoViewModel)
            }
            else {
                HomeView(photos: photoViewModel.photos)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
