//
//  SignUpView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct SignUpView: View {
    private let  service = WebService()
    
    @State private var name = ""
    @State private var email = ""
    @State private var cpf = ""
    @State private var phoneNumber = ""
    @State private var healthPlan: String
    @State private var password = ""
    @State private var isShowingAlert = false
    @State private var isPacientRegistered = false
    @State private var navigationSignView = false
    
    let healthPlans = ["Unimed", "Sulamérica", "Bradesco", "Amil", "NotreDame", "Outro"]
    
    init() {
        self.healthPlan = healthPlans[0]
    }
    
    func registerPatient() async {
        let patient = PatientModel(id: nil,
                                   cpf: cpf,
                                   name: name,
                                   email: email,
                                   password: password,
                                   phoneNumber: Int(phoneNumber) ?? 0,
                                   healthPlan: healthPlan)
        
        do {
            let result = try await service.registerPatient(patient: patient)
            
            switch result {
            case .success(let patient):
                isPacientRegistered = true
            case .failure:
                isPacientRegistered = false
            }
            
        } catch {
            print("An error occurred")
        }
        isShowingAlert = true
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 16.0) {
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 36.0, alignment: .center)
                    .padding(.vertical)
                
                TextDefaultView(
                    text: "Olá, boas-vindas!",
                    font: .title2
                )
                
                TextDefaultView(
                    text: "Insira seus dados para criar uma conta.",
                    isBold: false,
                    foreGroundColor: .gray
                ).padding(.bottom)
                
                TextDefaultView(text: "Nome")
                
                FieldView(
                    text: $name,
                    placeHolder: "Insira seu nome",
                    autocorrection: false
                )
                
                TextDefaultView(text: "Email")
                
                FieldView(
                    text: $email,
                    placeHolder: "Insira seu email",
                    keyboardType: .emailAddress,
                    autocorrection: false
                )
                
                TextDefaultView(text: "Cpf")
                
                FieldView(
                    text: $cpf,
                    placeHolder: "Insira seu CPF",
                    keyboardType: .numberPad
                )
                
                TextDefaultView(text: "Telefone")
                
                FieldView(
                    text: $phoneNumber,
                    placeHolder: "Insira seu telefone",
                    keyboardType: .numberPad
                )
                
                TextDefaultView(text: "Senha")
                
                FieldView(
                    text: $password,
                    placeHolder: "Insita sua Senha",
                    isSecure: true
                )
                
                TextDefaultView(text: "Selecione seu plano de saúde")
                
                Picker("Selecione seu Plano", selection: $healthPlan) {
                    ForEach(healthPlans, id: \.self) { plan in
                        Text(plan)
                    }
                }
            }
        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        
        VStack(spacing: 16) {
            Button(action: {
                Task {
                    await registerPatient()
                }
            }, label: {
                ButtonView(text: "Cadastrar")
            })
            
            NavigationLink {
                SignInView()
            } label: {
                Text("Já possui uma conta? Faça o login")
            }
        }
        .padding(.top, 0)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .navigationBarBackButtonHidden()
        .alert(isPacientRegistered ? "Sucesso" : "Ops Algo deu errado",
               isPresented: $isShowingAlert) {
            Button(action: {
                navigationSignView = true
            }, label: {
                Text("Ok")
            })
        } message: {
            if isPacientRegistered {
                Text("Cadastro realizado com sucesso")
            } else {
                Text("Error ao criar cadastro")
            }
        }
        .navigationDestination(isPresented: $navigationSignView) {
            SignInView()
        }
    }
}

#Preview {
    SignUpView()
}
