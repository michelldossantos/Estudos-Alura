//
//  ContentView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
           NavigationBar()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20){
                    OrderTypeGrid()
                    CarouselTabView()
                    StoreItemList(orders: storesMock, title: "Lojas")
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
