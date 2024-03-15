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
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Image(store.headerImage).resizable()
                    .scaledToFit()
                
                HStack {
                    Text(store.name)
                        .font(.title)
                        .bold()
                    Spacer()
                    Image(store.logoImage)
                }.padding(.vertical, 8)
                    .padding(.horizontal)
                
                HStack {
                    Text(store.location)
                    Spacer()
                    ForEach(1...store.stars, id: \.self) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                            .font(.caption)
                    }
                }.padding(.vertical, 8)
                    .padding(.horizontal)
                
                Text("Produtos")
                    .font(.title2)
                    .bold()
                    .padding()
                
                ForEach(store.products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ProductView(product: product)
                            .foregroundColor(.black)
                    }
                }
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
