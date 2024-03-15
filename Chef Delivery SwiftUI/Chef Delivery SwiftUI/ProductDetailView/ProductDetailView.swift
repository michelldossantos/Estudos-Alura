//
//  ProductDetailView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 15/03/24.
//

import SwiftUI

struct ProductDetailView: View {
    let product: ProductType
    
    var body: some View {
        Text(product.name)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: storesMock[0].products[0])
    }
}
