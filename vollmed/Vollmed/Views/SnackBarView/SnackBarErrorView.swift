//
//  SnackBarErrorView.swift
//  Vollmed
//
//  Created by Michel Santos on 26/04/24.
//

import SwiftUI

struct SnackBarErrorView: View {
    @Binding var isShowing: Bool
    let message: String
    
    var body: some View {
        VStack {
            Spacer()
            if isShowing {
                Text(message)
                    .padding()
                    .background(Color.red)
                    .foregroundStyle(.white)
                    .cornerRadius(10)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation {
                                isShowing = false
                            }
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, isShowing ? UIApplication.shared.getKeyWindow?.safeAreaInsets.bottom ?? 0 : -100)
        
    }
}

#Preview {
    SnackBarErrorView(isShowing: .constant(true), message: "Texto Teste")
}
