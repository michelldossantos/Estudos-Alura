//
//  ScheduleAppointmentViewModel.swift
//  Vollmed
//
//  Created by Michel Santos on 23/04/24.
//

import Foundation

class ScheduleAppointmentViewModel: ObservableObject {
    //MARK: - Attibutes
    let auth = AuthenticatorManager.shared
    let service: ScheduleAppointmentServiceable
    
    //MARK: Init
    init(service: ScheduleAppointmentServiceable) {
        self.service = service
    }
    
    //MARK: Init
    func scheduleAppointment(specialistID: String,
                             patientID: String,
                             date: String) async throws -> ScheduleAppointmentResponse? {
        let patientId = auth.patientId ?? ""
        let result = try await service.scheduleAppointment(scheduleAppointment: .init(specialistID: specialistID, 
                                                                                      patientID: patientId,
                                                                                      date: date))
        
        switch result {
        case .success(let model):
            return model
        case .failure(let error):
            throw error
        }
    }
}
