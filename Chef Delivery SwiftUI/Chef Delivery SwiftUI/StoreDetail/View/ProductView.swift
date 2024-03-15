//
//  ProductView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 14/03/24.
//

import SwiftUI

struct ProductView: View {
    let product: ProductType
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.name)
                        .font(.title3)
                        .bold()
                    Text(product.description)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                        .lineLimit(.none)
                        .multilineTextAlignment(.leading)
                    Text(product.formattedPrice).bold()
                }
                Spacer()
                Image(product.image)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .frame(width: 120, height: 120)
                    .shadow(color: .black.opacity(0.3), radius: 20, x: 6, y: 8)
                    
                    
            }
            .padding()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(product: storesMock[0].products[0]).previewLayout(.sizeThatFits)
    }
}
