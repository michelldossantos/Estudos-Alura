//
//  StoreItemList.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 12/03/24.
//

import SwiftUI

struct StoreItemList: View {
    let stores: [StoreType]
    let title: String
    var body: some View {
        VStack(alignment: .leading) {
            Text("Lojas").font(.headline)
            ForEach(stores) { store in
                NavigationLink {
                    StoreDetailView(store: store)
                } label: {
                    StoreItemView(store: store)

                }
            }
        }.foregroundColor(.black)
    }
}

struct StoreItemList_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemList(stores: storesMock, title: "Loajas").previewLayout(.sizeThatFits)
            .padding()
    }
}
