//
//  ContentView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    let service = HomeService()

    @State private var storesAPI: [StoreType] = storesMock

    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20){
                        OrderTypeGrid()
                        CarouselTabView()
                        StoreItemList(stores: storesAPI)
                    }
                }
            }
            .padding()
        }.onAppear {
            service.fetchStores { result in
                switch result {
                case .success(let stores):
                    storesAPI = stores
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
