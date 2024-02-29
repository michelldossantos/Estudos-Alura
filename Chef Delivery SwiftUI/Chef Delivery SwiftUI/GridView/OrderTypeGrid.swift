//
//  SwiftUIView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct OrderTypeGrid: View {
    let orders = ["Mercado", "Bar", "Descontos", "Gourmet", "Pet", "Bebidas", "Lojas", "Test", "Test3", "Test4", "Test5" ]
    
    var body: some View {
        LazyHGrid(rows: [GridItem(.fixed(100)),
                         GridItem(.fixed(100))]) {
            ForEach(orders, id: \.self) { orderItem in
                Text(orderItem)
            }
        }
    }
}

struct OrderTypeGrid_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGrid()
    }
}
