//
//  Patient.swift
//  Vollmed
//
//  Created by Michel Santos on 11/04/24.
//

import Foundation

struct PatientModel: Codable, Identifiable {
    let id: String?
    let cpf: String
    let name: String
    let email: String
    let password: String
    let phoneNumber: Int
    let healthPlan: String
    
    enum CodingKeys: String, CodingKey {
        case id, cpf, email
        case name = "nome"
        case password = "senha"
        case phoneNumber = "telefone"
        case healthPlan = "planoSaude"
    }
}
