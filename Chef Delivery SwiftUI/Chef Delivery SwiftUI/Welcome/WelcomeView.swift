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
    
    let buttonHeight: CGFloat = 80
    
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
                
                ScrollView {
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
                            .padding(.horizontal, 32)
                        
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
                        
                        ZStack {
                            Capsule()
                                .fill(Color("ColorRed").opacity(0.2))
                            Capsule()
                                .fill(Color("ColorRed").opacity(0.2))
                                .padding(8)
                            Text("Descubra Mais")
                                .font(.title2)
                                .bold()
                                .foregroundColor(.white)
                                .offset(x: 20)
                            
                            HStack {
                                ZStack {
                                    Circle()
                                        .fill(Color("ColorRed"))
                                    Circle()
                                        .fill(Color("ColorRedDark"))
                                        .padding(8)
                                    Image(systemName: "chevron.right.2")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .bold()
                                }.frame(height: buttonHeight)
                                
                                Spacer()
                            }

                            
                        }.frame(width: geometry.size.width - 60, height: buttonHeight )

                        
                    }.onAppear {
                        withAnimation(.easeIn(duration: 2)) {
                            isAnimation = true
                        }
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
