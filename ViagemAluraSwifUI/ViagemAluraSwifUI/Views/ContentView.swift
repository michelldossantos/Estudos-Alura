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
            VStack(spacing: 25) {
                HeaderView().frame(width: view.size.width, height: 200, alignment: .top)

                List(viagens) { viagem in
                    TravelViewCell(viagem: viagem)
                } .listStyle(.inset)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
