//
//  StoreItemList.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 12/03/24.
//

import SwiftUI

enum Distance: Int, CaseIterable {
    case one = 1
    case five = 5
    case ten = 10
    case twenty = 20
}

struct DistanceButton: View {
    let distance: Distance

    var body: some View {
        Button(action: {
            print("Distância selecionada: \(distance.rawValue) km")
        }) {
            Text("Até \(distance.rawValue) km")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

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
                Menu("Distâncias") {
                    ForEach(Distance.allCases, id: \.self) { distance in
                        DistanceButton(distance: distance)
                    }
                }
                Menu("Filtrar") {
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar Filtro")
                    }
                    Divider()
                    
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
