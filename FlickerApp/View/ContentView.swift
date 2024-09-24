//
//  ContentView.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @StateObject private var viewModel = ImageViewModel()
    
    // Computed Property returning appropriate URL based on the search text
    var filteredSearch: String {
        searchText.isEmpty ? APIUrls.imageUrl.rawValue : APIUrls.imageUrl.rawValue + searchText
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchSection
                if !viewModel.loading {
                    ProgressView()
                }
                ScrollView {
                    ImageGridView(imageData: viewModel.imageData)
                        .accessibilityIdentifier(AccessibilityIdentifier.imageGridView.rawValue)
                }
            }
            .navigationTitle(TextPhrases.imageSearch.rawValue)
            .onAppear {
                loadData()
            }
        }
    }
    
    //MARK: Private Methods of ContentView
    private var searchSection: some View {
        SearchBar(text: $searchText)
            .accessibilityIdentifier(AccessibilityIdentifier.searchBar.rawValue)
            .onChange(of: searchText) { _ in
                Task {
                    await fetchData()
                }
            }
    }
    
    private func fetchData() async {
        do {
            try await viewModel.loadData(url: filteredSearch)
        } catch {
            print(Errors.dataLoadingError.rawValue)
        }
    }

    private func loadData() {
        Task {
            await fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
