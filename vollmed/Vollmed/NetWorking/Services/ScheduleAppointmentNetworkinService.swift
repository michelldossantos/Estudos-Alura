//
//  ScheduleAppointmentNetworkinService.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

protocol ScheduleAppointmentServiceable {
   func scheduleAppointment(scheduleAppointment: ScheduleAppointmentRequest) async throws -> Result<ScheduleAppointmentResponse?, APIError>
}

struct ScheduleAppointmentNetworkinService: ScheduleAppointmentServiceable, HTTPClient {
    func scheduleAppointment(scheduleAppointment: ScheduleAppointmentRequest) async throws -> Result<ScheduleAppointmentResponse?, APIError> {
        
        let endpoint = ScheduleAppointmentEndpoint.scheduleAppointment(scheduleAppointment)
        return await sendRequest(endpoint: endpoint, responseModel: ScheduleAppointmentResponse.self)
    }
}
