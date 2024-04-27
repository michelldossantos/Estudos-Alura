//
//  ErrorResponse.swift
//  Vollmed
//
//  Created by Michel Santos on 27/04/24.
//

import Foundation

struct ErrorResponse: Codable {
    let error: ErrorInfo
}

struct ErrorInfo: Codable {
    let message: String
    let code: Int
}
