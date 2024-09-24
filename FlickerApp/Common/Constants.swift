//
//  Constant.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import Foundation

// MARK: - API URLs
enum APIUrls: String {
    case imageUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags="
    case defaultUrl = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=porcupine"
}

// MARK: - Text Phrases
enum TextPhrases: String {
    case welcomeMessage = "Welcome to Flickr Image Search"
    case searchText = "Search for the Image"
    case imageSearch = "Image Search"
    case noDataFound = "N/A"
    case noTitleAvailable = "No title available"
}

// MARK: - System Images
enum SystemImages: String {
    case magnify = "magnifyingglass"
    case searchCircle =  "multiply.circle.fill"
    case starFill = "star.fill"
    case squareArrowUP = "square.and.arrow.up"
    case photo = "photo"
}

// MARK: - Error Messages
enum Errors: String {
    case invalidURL = "Invalid URL"
    case decodeError = "Error while decoding"
    case dataLoadingError = "Error loading data: "
    case otherError = "Error while fetching"
}

//MARK: - Accessibility Identifier
enum AccessibilityIdentifier: String {
    case imageGridView = "ImageGridView"
    case searchBar = "searchBar"
}

//MARK: - Accessibility Label
enum AccessibilityLabel: String {
    case clearText = "Clear text"
}
