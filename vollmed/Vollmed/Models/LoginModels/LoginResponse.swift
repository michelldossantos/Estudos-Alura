//
//  LoginResponse.swift
//  Vollmed
//
//  Created by Michel Santos on 24/04/24.
//

import Foundation

struct LoginResponse: Decodable, Identifiable {
    let id: String
    let auth: Bool
    let token: String
}
