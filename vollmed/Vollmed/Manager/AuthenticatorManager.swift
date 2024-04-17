//
//  AuthenticatorManager.swift
//  Vollmed
//
//  Created by Michel Santos on 17/04/24.
//

import Foundation

class AuthenticatorManager: ObservableObject {
    @Published var token: String?
    @Published var patientId: String?
    
    static let shared = AuthenticatorManager()
    
    private init() {
        self.token = KeychainHelper.getValue(key: UserDefaultKeys.token.rawValue)
        self.patientId = KeychainHelper.getValue(key: UserDefaultKeys.patientID.rawValue)
    }
    
    func saveToken(token: String) {
        KeychainHelper.save(value: token, key: UserDefaultKeys.token.rawValue)
        self.token = token
    }
    
    func removeToken() {
        KeychainHelper.remove(key: UserDefaultKeys.token.rawValue)
        token =  nil
    }
    
    func savePatientID(id: String) {
        KeychainHelper.save(value: id, key: UserDefaultKeys.patientID.rawValue)
        self.patientId = id
    }
    
    func removePatientID() {
        KeychainHelper.remove(key: UserDefaultKeys.patientID.rawValue)
        patientId =  nil
    }
}
