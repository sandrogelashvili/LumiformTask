# Lumiform iOS Challenge

This project is a submission for the Lumiform challenge. It is a SwiftUI-based iOS application designed to render and display form-driven content parsed from a nested JSON structure.

## Project Overview

- Written entirely in Swift and SwiftUI
- Uses MVVM architecture
- Dynamically renders UI from a nested JSON
- Clearly visualizes hierarchical content structures
- Custom navigation with a lightweight router
- Supports both light and dark mode
- No third-party libraries used

## Features

- Parses and displays deeply nested JSON structures
- Image thumbnails can be tapped to show a full-screen view with title
- Offline caching using `URLSession`’s native caching mechanism
- Networking and image loading both use `URLSession`
- UI components follow principles of the Atomic Design System
- Responsive UI with support for light and dark appearance modes

## Architecture

The app is structured following the MVVM pattern:

- **Models**: Represent the parsed JSON data.
- **ViewModels**: Handle transformation logic between raw data and views.
- **Views**: SwiftUI views driven purely by the ViewModel.
- **Router**: Handles navigation manually, allowing for better decoupling and control.

## Offline Support

The app leverages the built-in caching capabilities of `URLSession`. Once data is fetched, it is cached and available for offline use as long as the system retains it. Image requests also use the same mechanism.

## Requirements

- iOS 17 or later
- Xcode 16.3
- Swift 6.1

## Running the App

1. Clone the repository:
   ```bash
   git clone https://github.com/sandrogelashvili/LumiformTask
   cd LumiformTask
   open LumiformTask.xcodeproj

## Additional Notes

-	The app does not rely on third-party libraries to minimize dependencies and complexity.
-	The user interface adjusts to system appearance and works seamlessly in both light and dark modes.
-	The project avoids use of Interface Builder; everything is built with SwiftUI programmatically.

## Author

Aleksandre Gelashvili
