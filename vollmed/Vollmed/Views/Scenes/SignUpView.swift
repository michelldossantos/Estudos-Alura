//
//  SignUpView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var cpf = ""
    @State private var phoneNumber = ""
    @State private var healthPlan: String
    @State private var password = ""


    
    let healthPlans = ["Unimed", "Sulamérica", "Bradesco", "Amil", "NotreDame", "Outro"]

    init() {
        self.healthPlan = healthPlans[0]
    }
    
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
                
                Text("Nome")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insita seu nome", text: $name)
                    .padding(14)
                    .bold()
                    .autocorrectionDisabled()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)

                
                Text("Email")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu email", text: $email)
                    .padding()
                    .bold()
                    .autocorrectionDisabled()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
                Text("CPF")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu CPF", text: $cpf)
                    .padding()
                    .bold()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.numberPad)
                
                Text("Telefone")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                TextField("Insira seu telefone", text: $phoneNumber)
                    .padding(14)
                    .bold()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                    .keyboardType(.numberPad)
                
                Text("Senha")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                SecureField("Insita sua Senha", text: $password)
                    .padding(14)
                    .bold()
                    .background(Color.gray.opacity(0.25))
                    .cornerRadius(14.0)
                
                Text("Selecione seu plano de saúde")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.accent)
                
                Picker("Selecione seu Plano", selection: $healthPlan) {
                    ForEach(healthPlans, id: \.self) { plan in
                        Text(plan)
                    }
                }
                
            }
            
        }
        .padding()
        
        Button(action: {}, label: {
            ButtonView(text: "Cadastrar")
        })
        
        NavigationLink {
            SignInView()
        } label: {
            Text("Já possui uma conta? Faça o login")
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    SignUpView()
}
