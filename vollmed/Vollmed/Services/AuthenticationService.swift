//
//  AuthenticationService.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, APIError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, APIError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
}
