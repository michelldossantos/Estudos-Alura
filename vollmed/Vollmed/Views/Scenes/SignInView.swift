//
//  SignInView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct SignInView: View {
    let service = WebService()
    
    @State private var email = ""
    @State private var password = ""
    @State private var showLoading = false
    
    func login(loginRequest: LoginRequest) async {
        do {
            showLoading = true
            let result = try await service.loginPatient(loginRequest: loginRequest)
            switch result {
            case .success(let result):
                KeychainHelper.save(value: result.token, key: UserDefaultKeys.token.rawValue)
                KeychainHelper.save(value: result.id, key: UserDefaultKeys.patientID.rawValue)
                print("Login Sucesso \(result)")
            case .failure(let error):
                print("API error \(error.localizedDescription)")
            }
        } catch {
            print("Ocorreu um erro ao fazer login")
        }
        showLoading = false
    }
    
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
            
            FieldView(text: $password, placeHolder: "Digite sua senha", isSecure: true)
            
            Button {
                Task {
                    let loginResponse: LoginRequest = .init(email: email, password: password)
                    await login(loginRequest: loginResponse)
                }
            } label: {
                if showLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .foregroundColor(.white)
                } else {
                    ButtonView(text: "Entrar")
                }
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
