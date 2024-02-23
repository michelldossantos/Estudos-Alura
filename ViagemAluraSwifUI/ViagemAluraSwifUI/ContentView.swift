//
//  ContentView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 23/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Viagens")
            Text("ESPECIAL")
            Text("BRASIL")
            
            List {
                Text("Viagens")
                Text("ESPECIAL")
                Text("BRASIL")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
