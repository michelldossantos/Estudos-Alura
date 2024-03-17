//
//  CarouselItemView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 11/03/24.
//

import SwiftUI

struct CarouselItemView: View {
    let order: OrderType
    
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

struct CarouselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselItemView(order: .init(id: 1,
                                      name: "",
                                      image: "barbecue-banner"))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
