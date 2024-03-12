//
//  CarouselTabView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 11/03/24.
//

import SwiftUI

struct CarouselTabView: View {
    let ordersMock: [OrderType] = [
        .init(id: 1, name: "banner burguer", image: "barbecue-banner"),
        .init(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        .init(id: 3, name: "banner burguer", image: "barbecue-banner")
    ]
    
    var body: some View {
        TabView {
            ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
            }
        }.frame(height: 180)
            .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView().previewLayout(.sizeThatFits)

    }
}
