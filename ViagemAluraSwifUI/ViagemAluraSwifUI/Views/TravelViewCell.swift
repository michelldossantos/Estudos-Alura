//
//  TravelView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 27/02/24.
//

import SwiftUI

struct TravelViewCell: View {
    var viagem: Viagem
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viagem.titulo).font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24 ))
            Image(viagem.imagem).resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: self.horizontalSizeClass == .compact ? 125 : 210)
                .clipped()
            HStack {
                Text(viagem.quantidadeDeDias).font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24 ))
                Spacer()
                Text(viagem.valor).font(.custom("Avenir", size: self.horizontalSizeClass == .compact ? 14 : 24 ))
            }
        }
    }
}

struct TravelViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TravelViewCell(viagem: viagens[0])
            .previewLayout(.fixed(width: 350, height: 200))
        
        TravelViewCell(viagem: viagens[0])
            .previewDevice(PreviewDevice(rawValue: "iPad (10th generation)"))
            .previewDisplayName("iPad 10")
    }
}
