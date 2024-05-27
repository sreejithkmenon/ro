//
//  RogramApp.swift
//  Rogram
//
//  Created by Sreejith K Menon on 25/05/24.
//

import SwiftUI

/// The main entry point of the SwiftUI application.
/// `RogramApp` is structured using the App protocol that defines the behavior and structure of an app.
/// Documentation and comments are written considering future contributors who may not be familiar with the initial design decisions.
@main
struct RogramApp: App {
    // The scene property defines the app's user interface.
    // `WindowGroup` is used to manage a group of windows that share the same content.
    // This is particularly useful for supporting multi-window setups on platforms like iPadOS and macOS.
    var body: some Scene {
        WindowGroup {
            // ContentView() is the root view of the app where the UI layout starts.
            // In a larger application, `ContentView` would typically be the place where you
            // setup navigation and other broader view hierarchies.
            ContentView()
        }
    }
}
