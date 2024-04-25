//
//  HomeNetworkingService.swift
//  Vollmed
//
//  Created by Michel Santos on 22/04/24.
//

import Foundation

protocol HomeServiceable {
    func getSpecialist() async throws -> Result<[Specialist]?, APIError>
}

struct HomeNetworkingService: HomeServiceable, HTTPClient {
    func getSpecialist() async throws -> Result<[Specialist]?, APIError> {
        let endpoint = HomeEndpoint.getAllSpecialists
        return await sendRequest(endpoint: endpoint, responseModel: [Specialist].self)
    }
}
