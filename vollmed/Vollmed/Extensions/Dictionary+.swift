//
//  Dictionary+.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

public extension Dictionary {
    func toData() -> Data? {
        guard let data = try? JSONSerialization.data(withJSONObject: self, options: JSONSerialization.WritingOptions.prettyPrinted) else {
            return nil
        }
        return data
    }
}
