//
//  HTTPClient.swift
//  Vollmed
//
//  Created by Michel Santos on 19/04/24.
//

import Foundation

protocol HTTPClient {
    func sendRequest<T: Decodable>(endpoint: Endpoint, responseModel: T.Type) async -> Result<T, APIError>
}
