//
//  APIError.swift
//  Vollmed
//
//  Created by Michel Santos on 19/04/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case imageNil
    case tokenFailed
    case noResponse
    case anauthorized
    case custom(_ error: [String: Any])
    case unknow
    
    var customMessage: String {
        switch self {
        case .decodingFailed:
            return "Erro de decodificação"
        case .anauthorized:
            return "Sessão expirada"
        case .custom(let error):
            if let error: ErrorResponse = error.decode() {
                return error.error.message
            }
            return "Ops Ocorreu um erro ao carregar as informações"
        default:
            return "Erro Desconhecido"
        }
    }
}
