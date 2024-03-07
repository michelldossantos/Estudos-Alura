//
//  SwiftUIView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct OrderTypeGrid: View {
    var gridLayout: [GridItem] {
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15) {
            ForEach(ordersMock) { orderItem in
                OrderTypeView(orderType: orderItem)
            }
        }.frame(height: 200)
            .padding(.horizontal, 16)
            .padding(.top, 16)
    }
}

struct OrderTypeGrid_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGrid().previewLayout(.sizeThatFits)
    }
}
