//
//  UserDefaultHelper.swift
//  Vollmed
//
//  Created by Michel Santos on 12/04/24.
//

import Foundation

enum UserDefaultKeys: String {
    case token = "app-vollmed-token"
    case patientID = "app-vollmed-patientId"
}

struct UserDefaultHelper {
    static func save(value: String, key: String) {
        UserDefaults.standard.setValue(value, forKey: key)
    }
    
    static func getValue(key: String) -> String? {
        UserDefaults.standard.string(forKey: key)
    }
    
    static func remove(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
