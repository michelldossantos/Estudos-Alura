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
    
    func decode<T: Decodable>() -> T? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self)
            let decoder = JSONDecoder()
            let decodedObject = try decoder.decode(T.self, from: jsonData)
            return decodedObject
        } catch {
            print("Error decoding object: \(error)")
            return nil
        }
    }
}
