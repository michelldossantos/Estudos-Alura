//
//  CancelAppointmentView.swift
//  Vollmed
//
//  Created by Michel Santos on 08/04/24.
//

import SwiftUI

struct CancelAppointmentView: View {
    private let appointmentID: String
    let service = WebService()
    
    @State private var reasontocancel = ""
    @State private var isShowAlert = false
    @State private var isCancelAppointment = false
    
    private func cancelAppoitment() async {
        do {
            let result = try await service.cancelAppointment(
                appointmentID: appointmentID,
                reasonToCancel: reasontocancel
            )
            
            switch result {
            case .success:
                print("Consulta cancelada com sucesso")
                isCancelAppointment = true
            case .failure:
                isCancelAppointment = false
            }
            
            isShowAlert = true
        } catch {
            //TODO:
        }

    }
    
    init(appointmentID: String) {
        self.appointmentID = appointmentID
    }
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Cancelar Consulta")
                .font(.title2)
                .bold()
                .foregroundStyle(.accent)
                .padding(.top)
                .multilineTextAlignment(.center)
            
            TextEditor(text: $reasontocancel)
                .padding()
                .font(.title3)
                .foregroundStyle(.accent)
                .background(Color(.lightBlue).opacity(0.15))
                .scrollContentBackground(.hidden)
                .cornerRadius(16)
                .frame(maxHeight: 300)
            
            Button(action: {
                Task {
                    await cancelAppoitment()
                }
            },
                   label: {
                ButtonView(text: "Cancelar consulta", buttonType: .cancel)
            })
            
        }
        .padding()
        .navigationTitle("Cancelar consulta")
        .navigationBarTitleDisplayMode(.large)
        .alert(isCancelAppointment ? "Sucesso" : "Erro", isPresented: $isShowAlert, presenting: isCancelAppointment) { _ in
            Button(action: {
//            TODO: Dismiss view
            }) {
                Text("ok")
            }
        } message: { isCancel in
            Text(isCancel ? "Consulta cancelada com sucesso" : "Erro ao cancelar consulta")
        }
    }
}

#Preview {
    CancelAppointmentView(appointmentID: "123123")
}
