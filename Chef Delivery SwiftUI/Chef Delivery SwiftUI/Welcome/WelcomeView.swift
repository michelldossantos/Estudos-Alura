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
        VStack {
            Text("Bem vindo ao Chef Delivery")
                .font(.system(size: 40))
                .foregroundColor(Color("ColorRed"))
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top, 32)
                .opacity(isAnimation ? 1 : 0)
                .offset(y: isAnimation ? 0 : -40)
            
            
            Text("Aqui você encontra os melhores produtos para sua cozinha")
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(.top, 32)
                .opacity(isAnimation ? 1 : 0)
                .offset(y: isAnimation ? 0 : -40)
            Spacer()
        }.onAppear {
            withAnimation(.easeIn(duration: 2.5)) {
                isAnimation = true
            }
        }
    }
}
                          

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
