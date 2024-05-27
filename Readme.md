# Rogram

Rogram is an iOS application developed as a take-home challenge for the role of Staff iOS Engineer at Ro. The app displays a collection of images fetched from a remote JSON source, allowing users to view any image in fullscreen upon tapping.

## Features

- Fetch and display images from a JSON endpoint.
- Tap on any image to view it in fullscreen.
- Basic UI/UX as per the provided wireframe.

## Installation

Clone this repository to your local machine using the following command:

```bash
git clone https://github.com/sreejithkmenon/ro.git
```

Navigate to the project directory:

```bash
cd Rogram
```

Open the project in Xcode by double-clicking the `Rogram.xcodeproj` file or using the command:

```bash
open Rogram.xcodeproj
```

## Running the App

Ensure that you have Xcode installed on your Mac (download it from the [App Store](https://apps.apple.com/us/app/xcode/id497799835) if necessary). Once the project is open in Xcode:

1. Select a target device from the top device toolbar.
2. Press `Cmd + R` or click on the Play button in Xcode to build and run the project.

## Screenshots

Here are some screenshots of the app:

Home Screen                |  Fullscreen Image Modal
:-------------------------:|:-------------------------:
![](https://i.ibb.co/jRLJpJj/Simulator-Screen-Shot-i-Phone-14-2024-05-26-at-18-10-51.png)  |  ![](https://i.ibb.co/1KFqBD2/Simulator-Screen-Shot-i-Phone-14-2024-05-26-at-18-11-14.png)

## Project Structure

- `ViewModels`: Contains the logic for fetching and managing the data.
- `Networking`: Handles API requests and responses.
- `Models`: Defines the data structures.
- `Views`: Contains the UI components of the app.

## Technologies Used

- Swift: Programming language.
- SwiftUI: Framework for the UI.
- URLSession: Networking.

## Authors

- Sreejith Menon

## Acknowledgments

Thanks to Ro for the opportunity to work on this interesting challenge. If you have any questions or feedback, please reach out.
