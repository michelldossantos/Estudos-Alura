//
//  StoreItemView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 12/03/24.
//

import SwiftUI

struct StoreItemView: View {
    let order: OrderType
    
    var body: some View {
        HStack {
            Image(order.image)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(order.name)
                .font(.subheadline)
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: .init(id: 1, name: "Monstro Burguer", image: "monstro-burger-logo")).previewLayout(.sizeThatFits).padding()
    }
}
