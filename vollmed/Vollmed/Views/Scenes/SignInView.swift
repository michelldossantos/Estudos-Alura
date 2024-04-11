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
            
            TextDefaultView(
                text: "Olá",
                font: .title2
            )
            
            TextDefaultView(
                text: "Preencha para acessar sua conta",
                foreGroundColor: .gray
            ).padding(.bottom)
            
            TextDefaultView(text: "Email")
                .padding(.top)
            
            FieldView(
                text: $email,
                placeHolder: "Digite seu email"
            )
            TextDefaultView(text: "Senha")
                .padding(.top)
            
            FieldView(text: $senha, placeHolder: "Digite sua senha", isSecure: true)
            
            Button {
                //TODO
            } label: {
                ButtonView(text: "Entrar")
            }
            
            NavigationLink {
                SignUpView()
            } label: {
                VStack {
                    TextDefaultView(
                        text: "Ainda não possui uma conta? Cadastre-se!",
                        font: .headline,
                        isBold: false,
                        foreGroundColor: .gray
                    )
                    .frame(
                        maxWidth: .infinity,
                        alignment: .center
                    )

                }
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SignInView()
}
