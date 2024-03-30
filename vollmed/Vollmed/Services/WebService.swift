//
//  WebService.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
}

struct WebService {
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
