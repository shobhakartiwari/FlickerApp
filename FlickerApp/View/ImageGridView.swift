//
//  ImageGridView.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import Foundation
import SwiftUI

// MARK: ImageGridView
struct ImageGridView: View {
    var imageData: [Item]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 3), spacing: 10) {
            ForEach(imageData, id: \.self) { item in
                if let imageUrlString = item.media?.m, !imageUrlString.isEmpty {
                    if let imageUrl = URL(string: imageUrlString) {
                        NavigationLink(destination: DetailView(item: item)) {

                            /// Loads an image asynchronously and caches it.
                            /// - Parameter url: The URL of the image to load.
                            AsyncImage(url: imageUrl) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 120, height: 100)
                                        .clipped()
                                case .failure:
                                    Image(systemName: SystemImages.photo.rawValue)
                                        .resizable()
                                        .frame(width: 120, height: 100)
                                        .background(Color.gray.opacity(0.3))
                                case .empty:
                                    ProgressView()
                                        .frame(width: 120, height: 100)
                                        .background(Color.gray.opacity(0.3))
                                @unknown default:
                                    EmptyView()
                                }
                            }
                            .onAppear {
                                loadImage(from: imageUrl)
                            }
                        }
                        .accessibilityLabel(getAccessibilityLabel(for: item.title))
                        .accessibilityIdentifier(AccessibilityIdentifier.imageGridView.rawValue)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
    
    /// Caches the image data for the given URL.
    /// - Parameter url: The URL of the image to cache.
    private func loadImage(from url: URL) {
        let cacheKey = url.absoluteString
        if ImageCache.shared.image(forKey: cacheKey) == nil {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    ImageCache.shared.setImage(image, forKey: cacheKey)
                }
            }
            task.resume()
        }
    }
    
    /// Generates an accessibility label based on the image title.
    private func getAccessibilityLabel(for title: String?) -> String {
        guard let title = title, !title.isEmpty else {
            return TextPhrases.noTitleAvailable.rawValue
        }
        return title
    }
}
