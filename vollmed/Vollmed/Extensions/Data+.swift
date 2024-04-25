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
}
