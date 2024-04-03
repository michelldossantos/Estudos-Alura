//
//  ScheduleAppointmentView.swift
//  Vollmed
//
//  Created by Michel Santos on 01/04/24.
//

import SwiftUI

struct ScheduleAppointmentView: View {
    @State private var selectedDate = Date()
    
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
            }, label: {
                ButtonView(text: "Agendar")
            })
        }
        .padding()
        .navigationTitle("Agendar Consulta")
        .onAppear {
            UIDatePicker.appearance().minuteInterval = 15
        }
    }
}

#Preview {
    ScheduleAppointmentView()
}
