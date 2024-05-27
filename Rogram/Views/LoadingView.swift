//
//  LoadingView.swift
//  Rogram
//
//  Created by Sreejith K Menon on 26/05/24.
//

import SwiftUI

/// A view component displaying a loading indicator.
///
/// This view is used when the app is processing or waiting for data.
/// It presents a simple visual feedback to the user in the form of a progress indicator.
///
/// ## Usage:
/// Place `LoadingView()` where a loading indicator needs to be displayed during data fetch or processing.
///
/// ## Assumptions:
/// - The `LoadingView` is used as an overlay or within a screen where data load time is noticeable.
/// - Suitable for all device orientations and screen sizes.
struct LoadingView: View {
    var body: some View {
        VStack {
            // ProgressView is a SwiftUI view that shows a circular activity indicator.
            // It automatically adapts to the platform conventions for activity indicators.
            ProgressView()
        }
    }
}

/// Provides a preview of the `LoadingView`.
///
/// This preview is used within the development environment to visualize the `LoadingView`.
/// It is not part of the production code and should be excluded from the production build.
///
/// - Returns: A `LoadingView` configured for preview purposes.
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        // Here the `LoadingView` is being instantiated for preview.
        // This helps developers and designers see the view in the Xcode canvas.
        LoadingView()
    }
}
