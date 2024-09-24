//
//  SearchBar.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//


import Foundation
import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        TextField(TextPhrases.searchText.rawValue, text: $text)
            .accessibilityIdentifier(AccessibilityIdentifier.searchBar.rawValue)
            .padding(8)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(searchOverlay)
            .padding(.horizontal)
    }
    
    private var searchOverlay: some View {
        HStack {
            Spacer()
            searchIcon
            clearButton
        }
    }
    
    private var searchIcon: some View {
        Image(systemName: SystemImages.magnify.rawValue)
            .foregroundColor(.gray)
            .padding(.leading, 8)
    }
    
    private var clearButton: some View {
        AnyView(
            Group {
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: SystemImages.searchCircle.rawValue)
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                            .accessibilityLabel(AccessibilityLabel.clearText.rawValue)
                    }
                } else {
                    EmptyView()
                }
            }
        )
    }
}


