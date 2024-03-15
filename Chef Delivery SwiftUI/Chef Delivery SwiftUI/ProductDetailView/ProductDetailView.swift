//
//  ProductDetailView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 15/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 20)
            VStack(alignment: .leading, spacing: 16) {
                Text(product.name)
                    .font(.title)
                    .bold()
                    .padding(.horizontal)
                Text(product.description)
                    .font(.callout)
                    .padding(.horizontal)
                Text(product.formattedPrice)
                    .font(.title3)
                    .bold()
                    .padding(.horizontal)
            }.padding(.top, 16)
            Spacer()
            
            VStack(spacing: 15) {
                Text("Quantidade")
                    .font(.title3)
                HStack {
                    
                    Button {
                        if productQuantity > 1 {
                            productQuantity -= 1
                        }
                    } label: {
                        Image(systemName: "minus.circle.fill")
                            .font(.title)
                            .bold()
                    }
                    Text("\(productQuantity)")
                        .font(.title2)
                        .bold()
                    
                    Button {
                        productQuantity += 1
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .bold()
                    }
                }
            }
            Spacer()
            
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
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}
