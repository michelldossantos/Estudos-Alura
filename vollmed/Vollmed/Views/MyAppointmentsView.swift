//
//  MyAppointmentsView.swift
//  Vollmed
//
//  Created by Michel Santos on 05/04/24.
//

import SwiftUI

struct MyAppointmentsView: View {
    let service = WebService()
    @State private var appointments: [AppointmentResult] = []
    
    func getAllAppointments() async {
        
        do {
            let result = try await service.getAllAppointments(patientID: patientID)
            
            switch result {
            case .success(let appointmets):
                self.appointments = appointmets
            case .failure(let error):
                print("ocorreu um erro \(error)")
            }
        } catch {
            print("ocorreu um erro catch \(error)")
        }
    }
    
    var body: some View {
        ScrollView {
            ForEach(appointments) { appointment in
                SpecialistCardView(specialist: appointment.specialist, appointment: appointment)
            }
        }.onAppear {
            Task {
               await getAllAppointments()
            }
        }
    }
}

#Preview {
    MyAppointmentsView()
}
