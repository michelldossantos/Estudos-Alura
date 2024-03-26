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

        func confirmeOrder(product: ProductType) async throws -> Result<ConfirmeProductResponse, APIError> {
            guard let url = URL(string: "https://private-072812-michelsantos.apiary-mock.com/questions") else {
                return .failure(.invalidURL)
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = try JSONEncoder().encode(product)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            let response = try JSONDecoder().decode(ConfirmeProductResponse.self, from: data)
            
            return .success(response)
        }
    }

struct ConfirmeProductResponse: Decodable {
    let message: String
}
