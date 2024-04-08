//
//  ScheduleAppointmentView.swift
//  Vollmed
//
//  Created by Michel Santos on 01/04/24.
//

import SwiftUI

struct ScheduleAppointmentView: View {
    let service = WebService()
    var specialistId: String
    var isRescheduleView: Bool
    var appointmentID: String?
    
    @State private var selectedDate = Date()
    @State private var isShowAlert = false
    @State private var isAppointmentScheduled = false
    
    init(specialistId: String, 
         isRescheduleView: Bool = false,
         appointmentID: String? = nil) {
        self.specialistId = specialistId
        self.isRescheduleView = isRescheduleView
        self.appointmentID = appointmentID
    }
    
    func rescheduleAppointment() async {
        guard let appointmentID else {
            print("Houve um erro ao obter a conulta do ID")
            return
        }
        
        print(appointmentID)
    }
    
    func scheduleAppointment() async {
        do {
            let result = try await service.scheduleAppointment(
                specialistID: specialistId,
                patientID: patientID,
                date: selectedDate.convertToString()
            )
            
            switch result {
            case .success(let result):
                print("#### + \(result)")
                isAppointmentScheduled = true
            case .failure:
                print("@@@@Algo deu errado")
                isAppointmentScheduled = false
            }
        } catch {
            print("###Algo deu Errado")
            isAppointmentScheduled = false
        }
        isShowAlert = true
    }
    
    var body: some View {
        VStack {
            Text("Selecione a data e horário da consulta")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .foregroundStyle(.accent)
            
            DatePicker("Escolha a data da consulta", selection: $selectedDate, in: Date()...)
                .datePickerStyle(.graphical)
            
            Button(action: {
                print("Agendar consulta \(selectedDate.convertToString().converterDateStringToReadableDate())")
                Task {
                    if isRescheduleView {
                        await rescheduleAppointment()
                    } else {
                        await scheduleAppointment()
                    }
                }
            }, label: {
                ButtonView(text: isRescheduleView ? "Reagendar" : "Agendar")
            })
        }
        .padding()
        .navigationTitle(isRescheduleView ? "Reagendar Consulta" : "Agendar Consulta")
        .onAppear {
            UIDatePicker.appearance().minuteInterval = 15
        }
        .alert(isAppointmentScheduled ? "Sucesso" : "Ops, Algo deu errado", isPresented: $isShowAlert, presenting: isAppointmentScheduled) { _ in
            Button(action: {}) {
                Text("ok")
            }
        } message: { isScheduled in
            Text(isScheduled ? "Consulta \(isRescheduleView ? "reagendar" : "agendar") com sucesso" : "Algo deu errado ao \(isRescheduleView ? "reagendada" : "agendada") a consulta")
        }
    }
}

#Preview {
    ScheduleAppointmentView(specialistId: "1234", appointmentID: "123123")
}
