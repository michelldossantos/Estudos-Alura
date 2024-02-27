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
                VStack {
                    Text("Viagens").foregroundColor(.white)
                        .font(.custom("Avenir Black", size: 20))
                        .lineLimit(0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding(.top, 10
                        )
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
                        .offset(x: 50)
                        .foregroundColor(.white)
                        .offset(y: -25)
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
                        .offset(x: -50)
                        .offset(y: -25)
                        .foregroundColor(.white)
                }


                
                    
                
                
                
                List(viagens) { viagem in
                    Text(viagem.titulo)
                }
            }.ignoresSafeArea(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
