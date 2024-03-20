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
    @State var imageOfSet: CGSize = .zero
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimation ? 200 : 0)
                    .position(x: isAnimation ? 50 : -50, y: isAnimation ? 100: -100)
                    .blur(radius: 60)
                    .opacity(isAnimation ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(Color("ColorRed"))
                    .frame(width: isAnimation ? 200 : 0)
                    .position(
                        x: isAnimation ? geometry.size.width - 50: geometry.size.width + 50 ,
                        y: isAnimation ? geometry.size.height - 50: geometry.size.height + 50)
                    .blur(radius: 60)
                    .opacity(isAnimation ? 0.5 : 0)
                
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
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimation ? 32 : 92)
                        .opacity(isAnimation ? 1 : 0)
                        .offset(x: imageOfSet.width, y: imageOfSet.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOfSet = gesture.translation
                                        
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        imageOfSet = .zero
                                    }
                                })
                        )
                    
                }.onAppear {
                    withAnimation(.easeIn(duration: 2)) {
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
