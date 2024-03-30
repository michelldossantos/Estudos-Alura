//
//  WebService.swift
//  Vollmed
//
//  Created by Giovanna Moeller on 12/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
}

struct WebService {
    
    private let baseURL = "http://localhost:3000"
    
    func  getAllSpecialists() async throws -> Result<[Specialist], APIError> {
        let endpoint = baseURL + "/especialistas"
        guard let url = URL(string: endpoint) else {
            return .failure(.invalidURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let specialists = try JSONDecoder().decode([Specialist].self, from: data)
        
        return .success(specialists)
        
    }
}
