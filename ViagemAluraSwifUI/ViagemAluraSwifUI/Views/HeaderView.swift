//
//  HeaderView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 27/02/24.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        GeometryReader { view in
            VStack {
                VStack {
                    Text("Viagens")
                        .foregroundColor(.white)
                        .font(.custom("Avenir Black", size: self.horizontalSizeClass == .compact ? 20 : 30))
                        .lineLimit(0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Text("ESPECIAL").foregroundColor(.white)
                        .font(.custom("Avenir Book", size: self.horizontalSizeClass == .compact ? 20 : 30))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 30)
                    Text("BRASIL").foregroundColor(.white)
                        .font(.custom("Avenir Black", size: self.horizontalSizeClass == .compact ? 23: 33))
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

            }
        }
        }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewLayout(.fixed(width: 400, height: 220))
    }
}
