//
//  NetworkClient.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import Foundation
protocol NetworkClient {
    
    // MARK: - Method Requirements
    func fetchData<T: Decodable>(for: T.Type, url: String) async throws -> T?
}
