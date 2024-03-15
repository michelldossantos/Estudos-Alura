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
        return storesMock.filter { store in
            store.stars >= ratingFilter
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Lojas").font(.headline)
                Spacer()
                Menu("Filtrar") {
                    ForEach(1...5, id: \.self) { rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text("\(rating) estralas ou mais")
                            } else {
                                Text("\(rating) estrala ou mais")

                            }
                        }

                    }
                }
            }
            ForEach(filteredStore) { store in
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
        StoreItemList(stores: storesMock).previewLayout(.sizeThatFits)
            .padding()
    }
}
