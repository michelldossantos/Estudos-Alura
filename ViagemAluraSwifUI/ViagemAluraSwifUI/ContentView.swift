//
//  ContentView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 23/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { view in
            VStack(spacing: 0) {
//MARK: Botões
                VStack {
                    Text("Viagens")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Black", size: 20))
                        .lineLimit(0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text("ESPECIAL").foregroundColor(.white)
                        .font(.custom("Avenir Book", size: 20))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    Text("BRASIL").foregroundColor(.white)
                        .font(.custom("Avenir Black", size: 23))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                }
                .frame(width: view.size.width, height: 180, alignment: .top)
                .background(Color.purple)

                
//MARK: Botões
                HStack {
                    Button("Hotéis") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.frame(width: 100, height: 50)
                        .font(.custom("Avenir Medium", size: 17))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                                .background(Color.blue)
                        )
                        .cornerRadius(16)
                        .foregroundColor(.white)
                        .padding(.leading, 16)
                    Spacer()
                    
                    Button("Pacotes") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.frame(width: 100, height: 50)
                        .font(.custom("Avenir Medium", size: 17))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 1)
                                .background(Color.orange)
                        )
                        .cornerRadius(16)
                        .foregroundColor(.white)
                        .padding(.trailing, 16)
                }.padding(.top, -25)
                    .background(.clear)

//MARK: Lista
                List(viagens) { viagem in
                    VStack(alignment: .leading) {
                        Text(viagem.titulo)
                        Image(viagem.imagem).resizable()
                            .frame(height: 125)
                        HStack {
                            Text(viagem.quantidadeDeDias)
                            Spacer()
                            Text(viagem.valor)
                        }
                    }
                } .listStyle(.inset)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
