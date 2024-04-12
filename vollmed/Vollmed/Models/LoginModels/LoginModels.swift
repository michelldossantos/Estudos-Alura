//
//  LoginModels.swift
//  Vollmed
//
//  Created by Michel Santos on 12/04/24.
//

import Foundation

struct LoginRequest: Encodable {
    let email: String
    let password: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password = "senha"
    }
}

struct LoginResponse: Decodable, Identifiable {
    let id: String
    let auth: Bool
    let token: String
}
