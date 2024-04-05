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
    
    @State private var selectedDate = Date()
    @State private var isShowAlert = false
    @State private var isAppointmentScheduled = false
    
    func scheduleAppointment() async {
        do {
             let result = try await service.scheduleAppointment(specialistID: specialistId,
                                              patientID: patientID,
                                              date: selectedDate.convertToString())
            
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
                    await scheduleAppointment()
                }
            }, label: {
                ButtonView(text: "Agendar")
            })
        }
        .padding()
        .navigationTitle("Agendar Consulta")
        .onAppear {
            UIDatePicker.appearance().minuteInterval = 15
        }
        .alert(isAppointmentScheduled ? "Sucesso" : "Ops, Algo deu errado", isPresented: $isShowAlert, presenting: isAppointmentScheduled) { _ in
            Button(action: {}) {
                Text("ok")
            }
        } message: { isScheduled in
            Text(isScheduled ? "Consulta agendada com sucesso" : "Algo deu errado ao agendar a consulta")
        }
    }
}

#Preview {
    ScheduleAppointmentView(specialistId: "1234")
}
