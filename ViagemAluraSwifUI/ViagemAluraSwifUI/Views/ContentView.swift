//
//  ContentView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 23/02/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        GeometryReader { view in
            VStack(spacing: 0) {
                HeaderView().frame(width: view.size.width, height: 200, alignment: .top)

                List(viagens) { viagem in
                    TravelViewCell(viagem: viagem)
                } .listStyle(.inset)
                    .offset(y: self.horizontalSizeClass == .compact ? -25 : 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro"))
            .previewDisplayName("iPad")
        
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("Se 3")
    }
}
