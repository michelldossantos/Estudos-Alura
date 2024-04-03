//
//  ScheduleAppointmentRequest.swift
//  Vollmed
//
//  Created by Michel Santos on 03/04/24.
//

import Foundation

struct ScheduleAppointmentRequest: Codable {
    let specialistID: String
    let patientID: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case specialistID = "especialista"
        case patientID = "paciente"
        case date = "data"
    }
}
