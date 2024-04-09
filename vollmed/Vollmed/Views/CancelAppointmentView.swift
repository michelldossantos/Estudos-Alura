//
//  CancelAppointmentView.swift
//  Vollmed
//
//  Created by Michel Santos on 08/04/24.
//

import SwiftUI

struct CancelAppointmentView: View {
@State private var reasontocancel = ""

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
                
            }, label: {
                ButtonView(text: "Cancelar consulta", buttonType: .cancel)
            })

        }
        .padding()
        .navigationTitle("Cancelar consulta")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    CancelAppointmentView()
}
