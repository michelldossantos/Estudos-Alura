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
            
            VStack {
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
                List {
                    Text("Viagens")
                    Text("ESPECIAL")
                    Text("BRASIL")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
