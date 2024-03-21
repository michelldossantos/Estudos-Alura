//
//  CarouselTabView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 11/03/24.
//

import SwiftUI

struct CarouselTabView: View {
    @State private var correntIndex = 1
    
    let ordersMock: [OrderType] = [
        .init(id: 1, name: "banner burguer", image: "barbecue-banner"),
        .init(id: 2, name: "banner prato feito", image: "brazilian-meal-banner"),
        .init(id: 3, name: "banner burguer", image: "picanha")
    ]
    
    var body: some View {
        TabView(selection: $correntIndex) {
            ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
                    .tag(mock.id)
            }
        }.frame(height: 180)
            .tabViewStyle(.page(indexDisplayMode: .always))
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    if correntIndex > ordersMock.count {
                        correntIndex = 1
                    }
                    correntIndex += 1
                }
            }
    }
}

struct CarouselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselTabView().previewLayout(.sizeThatFits)
        
    }
}
