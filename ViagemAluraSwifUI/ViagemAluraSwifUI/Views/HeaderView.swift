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
            VStack(spacing: 0) {
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
                .frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 150 : 200, alignment: .top)
                .background(Color.purple)

                
    //MARK: Botões
                HStack {
                    Button("Hotéis") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.frame(width: 100, height: 50)
                        .font(.custom("Avenir Medium", size: self.horizontalSizeClass == .compact ? 17 : 24))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 1)
                                .background(Color.blue)
                        )
                        .cornerRadius(16)
                        .foregroundColor(.white)
//                        .padding(.leading, self.horizontalSizeClass == .compact ? 17 : view.size.width/4)
                        .offset(x: self.horizontalSizeClass == .compact ? 50 : view.size.width/4)
                        .offset(y: -25)
                    Spacer()
                    
                    Button("Pacotes") {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }.frame(width: 100, height: 50)
                        .font(.custom("Avenir Medium", size: self.horizontalSizeClass == .compact ? 17 : 24))
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.orange, lineWidth: 1)
                                .background(Color.orange)
                        )
                        .cornerRadius(16)
                        .foregroundColor(.white)
//                        .padding(.trailing, 16)
                        .offset(x: self.horizontalSizeClass == .compact ? -50 : -view.size.width/4)
                        .offset(y: -25)
                }
            }
        }
        }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")

        HeaderView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        
        HeaderView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
            .previewDisplayName("iPad")

    }

}
