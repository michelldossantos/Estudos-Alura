//
//  StoreItemList.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 12/03/24.
//

import SwiftUI

struct StoreItemList: View {
    let orders: [OrderType]
    let title: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lojas").font(.headline)
            ForEach(orders) { order in
                StoreItemView(order: order)
            }
        }
    }
}

struct StoreItemList_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemList(orders: storesMock, title: "Loajas").previewLayout(.sizeThatFits)
            .padding()
    }
}
