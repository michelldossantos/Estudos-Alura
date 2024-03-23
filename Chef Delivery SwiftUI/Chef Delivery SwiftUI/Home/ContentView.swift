//
//  ContentView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    let service = HomeService()

    @State private var stores: [StoreType] = storesMock

    var body: some View {
        NavigationView {
            VStack {
                NavigationBar()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 20){
                        OrderTypeGrid()
                        CarouselTabView()
                        StoreItemList(stores: stores)
                    }
                }
            }
            .padding()
        }.onAppear {
            Task {
                await getStores()
            }
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchStores()
            switch result {
            case .success(let stores):
                storesAPI = stores
            case .failure(let error):
                print(error.localizedDescription)
            }
        } catch {
            print("Error fetching stores: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
