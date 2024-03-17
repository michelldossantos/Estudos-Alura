//
//  StoreDetailView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 13/03/24.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.dismiss) var close
    @State private var selectedProduct: ProductType?
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                StoreDetailHeaderView(store: store)
                StoreDetailProductsView(products: store.products)
                
            }
            .navigationTitle(store.name)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        close()
                    } label: {
                            HStack(spacing: 4) {
                                Image(systemName: "cart")
                                Text("Lojas")
                            }.foregroundColor(Color("ColorRed"))
                        }
                }
            }
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
    }
}
