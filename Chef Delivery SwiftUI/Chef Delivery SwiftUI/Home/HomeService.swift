//
//  HomeService.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 21/03/24.
//

import Foundation

struct HomeService {
        func fetchStores(completion: @escaping (Result<[StoreType], Error>) -> Void) {
            guard let url = URL(string: "") else {
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    if let decodedResponse = try? JSONDecoder().decode([StoreType].self, from: data) {
                        DispatchQueue.main.async {
                            completion(.success(decodedResponse))
                        }
                        return
                    }
                }
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                completion(.failure(error ?? NSError(domain: "", code: 0, userInfo: nil)))
            }.resume()
        }
    }
