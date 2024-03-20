//
//  WelcomeView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 18/03/24.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    @State var isAnimation = false
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: 200)
                    .position(x: 50, y: 100)
                    .blur(radius: 60)
                    .opacity(0.5)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(y: isAnimation ? 0 : -40)
                
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: 200)
                    .position(x: geometry.size.width - 50, y: geometry.size.height - 50)
                    .blur(radius: 60)
                    .opacity(0.5)
                    .opacity(isAnimation ? 1 : 0)
                    .offset(y: isAnimation ? 0 : -40)
                
                VStack {
                    Text("Bem vindo ao Chef Delivery")
                        .font(.system(size: 40))
                        .foregroundColor(Color("ColorRed"))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.top, 32)
                        .opacity(isAnimation ? 1 : 0)
                        .offset(y: isAnimation ? 0 : -40)
                    
                    
                    Text("Peça as suas comidas no conforto da sua casa")
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.top, 32)
                        .opacity(isAnimation ? 1 : 0)
                        .offset(y: isAnimation ? 0 : -40)
                    Spacer()
                }.onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        isAnimation = true
                    }
            }
            }
        }
    }
}
                          

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
