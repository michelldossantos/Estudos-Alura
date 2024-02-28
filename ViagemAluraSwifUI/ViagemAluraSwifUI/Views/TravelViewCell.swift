//
//  TravelView.swift
//  ViagemAluraSwifUI
//
//  Created by Michel Santos on 27/02/24.
//

import SwiftUI

struct TravelViewCell: View {
    var viagem: Viagem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viagem.titulo)
            Image(viagem.imagem).resizable()
                .frame(height: 125)
            HStack {
                Text(viagem.quantidadeDeDias)
                Spacer()
                Text(viagem.valor)
            }
        }
    }
}

struct TravelViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TravelViewCell(viagem: viagens[0])
            .previewLayout(.fixed(width: 350, height: 200))
    }
}
