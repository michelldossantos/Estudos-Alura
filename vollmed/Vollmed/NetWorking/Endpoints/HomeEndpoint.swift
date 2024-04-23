//
//  HomeEndpoint.swift
//  Vollmed
//
//  Created by Michel Santos on 22/04/24.
//

import Foundation

enum HomeEndpoint {
    case getAllSpecialists
}

extension HomeEndpoint: Endpoint {
    var path: String {
        switch self {
        case .getAllSpecialists:
            return "/especialista"
        }
    }
}
