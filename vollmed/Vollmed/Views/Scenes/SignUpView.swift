//
//  SignUpView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                    .padding(.vertical)
                
                Text("Olá, boas-vindas!")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.accent)
                
                Text("Insira seus dados para criar uma conta.")
                    .font(.title3)
                    .foregroundStyle(.gray)
                    .padding(.bottom)
            }
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}
