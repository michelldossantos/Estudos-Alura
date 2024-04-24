//
//  HTTPClient.swift
//  Vollmed
//
//  Created by Michel Santos on 19/04/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type?) async -> Result<T?, APIError>
}

extension HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type?) async -> Result<T?, APIError> {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        urlComponents.port = 3000
        
        guard let url = urlComponents.url else {
            return .failure(.invalidURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            if let encodedBody = try? JSONEncoder().encode(body) {
            request.httpBody = encodedBody
            }
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let respose = response as? HTTPURLResponse  else {
                return .failure(.noResponse)
            }
            
           
            switch respose.statusCode {
                
            case 200...209:
                guard let responseModel = responseModel else {
                    return .success(nil)
                }
                
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    return .failure(.decodingFailed)
                }
                
                return .success(decodedResponse)
            case 401:
                return .failure(.anauthorized)
            default:
                return .failure(.unknow)
            }
        } catch {
            return .failure(.unknow)
        }
    }
}
