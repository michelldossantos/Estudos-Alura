//
//  ProductDetailQuantityView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 17/03/24.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    @Binding var productQuantity: Int
    
    var body: some View {
        VStack {
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
                    }
                }
            }
        }
    }
}


struct ProductDetailQuantityView_Previews: PreviewProvider {
    @State static var quantity = 1
    
    static var previews: some View {
        ProductDetailQuantityView(productQuantity: $quantity).previewLayout(.sizeThatFits)
    }
}
