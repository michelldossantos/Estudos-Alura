//
//  SignInView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var senha = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16.0) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
            
            Text("Olá")
                .font(.title2)
                .bold()
                .foregroundStyle(.accent)
            
            Text("Preencha para acessar sua conta")
                .font(.title3)
                .bold()
                .foregroundStyle(.gray)
                .padding(.bottom)
            
            Text("Email")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
                .padding(.bottom)
            
            TextField("Digite seu email", text: $email)
                .padding()
                .bold()
                .autocorrectionDisabled()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)

            Text("Senha")
                .font(.title3)
                .bold()
                .foregroundStyle(.accent)
                .padding(.bottom)
            
            SecureField("Digite sua Senha", text: $senha)
                .padding()
                .bold()
                .autocorrectionDisabled()
                .background(Color.gray.opacity(0.25))
                .cornerRadius(14.0)
                .textInputAutocapitalization(.never)
        }.padding()
    }
}

#Preview {
    SignInView()
}
