//
//  ScheduleAppointmentEndpoint.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

enum ScheduleAppointmentEndpoint {
    case scheduleAppointment(ScheduleAppointmentRequest)
}


extension ScheduleAppointmentEndpoint: Endpoint {
    var path: String {
        return "/consulta"
    }
    
    var header: [String : String]? {
        guard let token = AuthenticatorManager.shared.token else {
            return nil
        }
        
        return [
            "Authorization": "Bearer \(token)",
            "Content-Type": "application/json"
        ]
    }
    var body: Data? {
        switch self {
        case .scheduleAppointment(let request):
            let data = try? JSONEncoder().encode(request)

            return data
        }
    }
    
    var method: RequestMethod {
        return .post
    }
}
