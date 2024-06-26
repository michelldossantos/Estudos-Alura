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
        NavigationView {
            GeometryReader { view in
                VStack(spacing: 50) {
                    HeaderView().frame(width: view.size.width, height: self.horizontalSizeClass == .compact ? 200 : 300, alignment: .top)
                    
                    List(viagens) { viagem in
                        NavigationLink(destination: MapaView(coordinate: viagem.localizacao).navigationTitle("Localização")) {
                            TravelViewCell(viagem: viagem)
                        }
                        
                    } .listStyle(.inset)
                        .navigationBarTitle("")
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
            .previewDisplayName("iPhone 14")

        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad 10")
    }
}


//ContentView()
//    .previewDevice(PreviewDevice(rawValue: "iPhone 14"))
//    .previewDisplayName("iPhone 14")
//ContentView()
//    .previewDevice(PreviewDevice(rawValue: "iPad mini (6th generation)"))
//    .previewDisplayName("iPad Mini")
//
//ContentView()
//    .previewDevice(PreviewDevice(rawValue: "iPad Pro (9.7-inch)"))
//    .previewDisplayName("iPad 9.7")
//
//ContentView()
//    .previewDevice(PreviewDevice(rawValue: "iPad Pro (12.9-inch) (6th generation)"))
//    .previewDisplayName("iPad 12.9")
//
//ContentView()
//    .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
//    .previewDisplayName("Se 3")
