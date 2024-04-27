//
//  Data+.swift
//  Vollmed
//
//  Created by Michel Santos on 24/04/24.
//

import Foundation

extension Data {
    func toString() -> String {
        return String(data: self, encoding: .utf8) ?? ""
    }
    
    func convertToDictionary() -> [String: Any] {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any] {
                return dictionary
            }
        } catch {
            print("Erro ao converter Data para dicionário: \(error.localizedDescription)")
        }
        return [:]
    }
}
