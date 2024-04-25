//
//  ScheduleAppointmentResponse.swift
//  Vollmed
//
//  Created by Michel Santos on 03/04/24.
//

import Foundation

struct ScheduleAppointmentResponse: Decodable, Identifiable {
    let id: String
    let specialistID: String
    let patientID: String
    let date: String
    let reasonToCancel: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case specialistID = "especialista"
        case patientID = "paciente"
        case date = "data"
        case reasonToCancel = "motivoCancelamento"
    }
}
