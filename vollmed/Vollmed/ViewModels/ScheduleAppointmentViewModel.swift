//
//  ScheduleAppointmentViewModel.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

struct ScheduleAppointmentViewModel {
    //MARK: - Attibutes
    let service: ScheduleAppointmentServiceable
    var scheduleRequest: ScheduleAppointmentRequest

    
    //MARK: Init
    init(service: ScheduleAppointmentServiceable, 
         scheduleRequest: ScheduleAppointmentRequest) {
        self.service = service
        self.scheduleRequest = scheduleRequest
    }
    
    //MARK: Init
    func scheduleAppointment() async throws -> ScheduleAppointmentResponse? {
        let result = try await service.scheduleAppointment(scheduleAppointment: scheduleRequest)
        
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        }
    }
}
