//
//  SwiftUIView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct OrderTypeGrid: View {
    var body: some View {
        LazyHGrid(rows: [
            GridItem(.fixed(100)),
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]) {
            ForEach(ordersMock) { orderItem in
                Text(orderItem.name)
            }
            
        }
    }
}

struct OrderTypeGrid_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGrid()
    }
}
