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
    func  getAllSpecialists() async throws -> Result<[Specialist], APIError> {
        let url = SpecialistEndpoint.getAllSpecialists()
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let specialists = try JSONDecoder().decode([Specialist].self, from: data)
        
        return .success(specialists)
    }
}

struct SpecialistEndpoint {
    static let baseURL = "http://localhost:3000"
    
    static func getAllSpecialists() -> URL {
        return URL(string: baseURL + "/especialistas")!
    }
}
