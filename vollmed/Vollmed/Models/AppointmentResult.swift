//
//  AppointmentResult.swift
//  Vollmed
//
//  Created by Michel Santos on 05/04/24.
//

import Foundation

struct AppointmentResult: Identifiable, Decodable {
    let id: String
    let date: String
    let specialist: Specialist
    
    enum CodingKeys: String, CodingKey {
        case id
        case date = "data"
        case specialist = "especialista"
    }
}
