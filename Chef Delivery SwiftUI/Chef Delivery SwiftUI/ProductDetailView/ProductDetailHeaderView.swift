//
//  ProductDetailHeaderView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 17/03/24.
//

import SwiftUI

struct ProductDetailHeaderView: View {
    let product: ProductType
    
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
        }
    }
}

struct ProductDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailHeaderView(product: storesMock[0].products[0])
            .previewLayout(.sizeThatFits)
    }
}
