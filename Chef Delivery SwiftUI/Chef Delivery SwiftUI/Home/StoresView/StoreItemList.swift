//
//  StoreItemList.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 12/03/24.
//

import SwiftUI

struct StoreItemList: View {
    let stores: [StoreType]
    @State private var ratingFilter = 0
    var filteredStore: [StoreType] {
        return stores.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Lojas").font(.headline)
                Spacer()
                DistanceMenu()
                RatingMenu()
            }
            //TODO: Next
            if filteredStore.isEmpty {
                Text("Nenhuma loja encontrada")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("ColorRed"))
                    .padding(.vertical, 32)
                    .frame(maxWidth: .infinity)
                
            } else {
                ForEach(filteredStore) { store in
                    NavigationLink {
                        StoreDetailView(store: store)
                    } label: {
                        StoreItemView(store: store)
                        
                    }
                }
            }
        }.foregroundColor(.black)
    }
}

struct StoreItemList_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemList(stores: storesMock).previewLayout(.sizeThatFits)
            .padding()
    }
}
