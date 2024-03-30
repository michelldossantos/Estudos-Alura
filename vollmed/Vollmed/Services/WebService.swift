//
//  WebService.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
//

import UIKit

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case imageNil
}

struct WebService {
func getImages(from urlImage: String) async throws -> Result<UIImage?, APIError> {
    guard let url = URL(string: urlImage) else {
        return .failure(.invalidURL)
    }
    

    if let cachedResponse = URLSession.shared.configuration.urlCache?.cachedResponse(for: URLRequest(url: url)) {
        let image = UIImage(data: cachedResponse.data)
        return .success(image)
    }
    
//    if let cachedImage = imageCache.object(forKey: urlImage as NSString) {
//        return .success(cachedImage)
//    }
    
    do {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            return .failure(.requestFailed)
        }
        
        guard let image = UIImage(data: data) else {
            return .failure(.imageNil)
        }
        
        // Cache the image
        let cachedResponse = CachedURLResponse(response: response, data: data)
        URLSession.shared.configuration.urlCache?.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
//        imageCache.setObject(image, forKey: urlImage as NSString)
        
        return .success(image)
    } catch {
        return .failure(.decodingFailed)
    }
}

    func getAllSpecialists() async throws -> Result<[Specialist], APIError> {
        let endpoint = SpecialistEndpoint.getAllSpecialists()
        
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                return .failure(.requestFailed)
            }
            
            let specialists = try JSONDecoder().decode([Specialist].self, from: data)
            
            return .success(specialists)
        } catch {
            return .failure(.decodingFailed)
        }
    }
}

struct SpecialistEndpoint {
    static let baseURL = "http://localhost:3000"
    
    static func getAllSpecialists() -> String {
        return ("\(baseURL)/especialista")
    }
}

//let imageCache = NSCache<NSString, UIImage>()
