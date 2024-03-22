//
//  HomeService.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 21/03/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case errorRequest(error: String)
}

struct HomeService {
        func fetchStores() async throws -> Result<[StoreType], APIError> {
            guard let url = URL(string: "anyURL") else {
                return .failure(.invalidURL)
            }
            let request = URLRequest(url: url)
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let storesObjects = try JSONDecoder().decode([StoreType].self, from: data)
            
            return .success(storesObjects)
        }
    }
