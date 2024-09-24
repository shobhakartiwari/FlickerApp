//
//  ApiClient.swift
//  FlickerApp
//
//  Created by Shobhakar Tiwari on 9/24/24.
//

import Foundation

// MARK: - APIManager

/// A singleton class responsible for handling network requests and decoding responses.
class APIManager: NetworkClient {
    /// Shared instance of the APIManager.
    static let sharedInstance = APIManager()
    
    /// Private initializer to ensure singleton usage.
    private init() {}
    
    /**
     Fetches data from a specified URL and decodes it into a specified type.

     - Parameters:
       - for: The type of the data to decode. Must conform to `Decodable`.
       - url: The URL string from which to fetch the data.

     - Returns: An optional decoded object of type `T` if successful, otherwise `nil`.

     - Throws: An error if the URL is invalid, or if there is an issue with data fetching or decoding.

     - Note: This method uses Swift's concurrency model with `async/await` to perform network operations.
     */
    func fetchData<T: Decodable>(for type: T.Type, url: String) async throws -> T? {
        guard let url = URL(string: url) else {
            print(Errors.invalidURL.rawValue)
            return nil
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print(Errors.decodeError.rawValue)
            return nil
        }
    }
}

