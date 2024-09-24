//
//  Extension.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import Foundation

// MARK: Extension to strip HTML tags from string
extension String {
    func stripHTML() -> String {
        guard let data = self.data(using: .utf8) else { return self }
        guard let attributedString = try? NSAttributedString(data: data,
                                                              options: [.documentType: NSAttributedString.DocumentType.html,
                                                                        .characterEncoding: String.Encoding.utf8.rawValue],
                                                              documentAttributes: nil) else { return self }
        return attributedString.string
    }
}
