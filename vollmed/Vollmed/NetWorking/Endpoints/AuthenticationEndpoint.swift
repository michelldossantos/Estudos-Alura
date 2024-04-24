//
//  AuthenticationEndpoint.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

enum AuthenticationEndpoint {
    case logout
}

extension AuthenticationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .logout:
            return "/auth/logout"
        }
    }
    
    var method: RequestMethod {
        return .post
    }
    
    var header: [String : String]? {
        guard let token = AuthenticatorManager.shared.token else {
            return nil
        }
        
        return [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
    }
}
