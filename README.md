# FlickerApp

FlickerApp is an iOS application built using **SwiftUI** and follows the **MVVM (Model-View-ViewModel)** architecture pattern. It allows users to search for photos using the Flickr API, displaying them in a grid, and offering the ability to view details for each image.

---

## Features

- Search for images using **Flickr API**.
- Display results in a grid format.
- View details of individual images.
- Custom image caching mechanism.
- Built using **SwiftUI** with **MVVM** architecture for separation of concerns.
- Unit and UI testing implemented.

---

## Project Structure

The project is organized as follows:

## Description

- **Common**: Contains constants, helper extensions, additional utilities, and image caching logic.
- **Model**: Includes data models used to interact with the Flickr API.
- **Network**: Manages API requests, includes a mock client for testing, and handles network calls.
- **View**: Houses the different views of the application, including the main content view, detailed view, image grid, search bar, and splash screen.
- **ViewModel**: Contains ViewModels responsible for business logic and data handling.
- **Assets**: Stores asset files and icons used throughout the app.
- **FlickerAppTests**: Contains unit tests for the application.
- **FlickerAppUITests**: Includes UI tests to ensure the application's interface functions correctly.

## Screenshots: 
## 1. Landing Screen
<img width="300" alt="Screenshot 2024-09-24 at 11 59 13 AM" src="https://github.com/user-attachments/assets/75fc47ed-751a-403c-a80e-4b495eec16be">

## 2. Details Screen
<img width="300" alt="Screenshot 2024-09-24 at 11 59 13 AM" src="https://github.com/user-attachments/assets/2431b311-f335-482a-8784-8b90ff84bdc3">


## Installation

Instructions for setting up the project locally.

### Prerequisites

- **Xcode 14.0** or later
- **Swift 5.7** or later
- **iOS 15.0** or later
- **CocoaPods** or **Swift Package Manager (SPM)** for dependencies (if any)

### Setup

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/FlickerApp.git
