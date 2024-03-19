//
//  ProductDetailView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 15/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity: Int = 1
    
    var body: some View {
        VStack {
            ProductDetailHeaderView(product: product)
            Spacer()
            ProductDetailQuantityView(productQuantity: $productQuantity)
            Text(String(productQuantity))
            Spacer()
            ProductDetailButtonView()
                .padding(.bottom)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}

struct ProductDetailButtonView: View {
    var body: some View {
        Button {
            //TODO:
        } label: {
            HStack {
                Image(systemName: "cart")
                Text("Adicionar ao carinho")
            }   .padding(.horizontal, 32)
                .padding(.vertical, 16)
                .font(.title3)
                .bold()
                .background(Color("ColorRed"))
                .foregroundColor(.white)
                .cornerRadius(32)
                .shadow(color: Color("ColorRedDark").opacity(0.7), radius: 10, x: 6, y: 8)
        }
    }
}
