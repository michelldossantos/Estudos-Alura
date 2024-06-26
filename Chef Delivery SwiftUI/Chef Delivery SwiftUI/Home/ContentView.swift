//
//  ContentView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct ContentView: View {
    let service = HomeService()

    @State private var stores: [StoreType] = []
    @State private var isLoading = true

    var body: some View {
        NavigationView {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    NavigationBar()
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 20){
                            OrderTypeGrid()
                            CarouselTabView()
                            StoreItemList(stores: stores)
                        }
                    }
                }
            }
            .padding()
        }.onAppear {
            Task {
//                await getStores()
            }
            getStoreWithAlamofire()
        }
    }
    
    func getStores() async {
        do {
            let result = try await service.fetchStores()
            switch result {
            case .success(let stores):
                isLoading = false
                self.stores = stores
            case .failure(let error):
                isLoading = false
                print(error.localizedDescription)
            }
        } catch {
            isLoading = false
            print("Error fetching stores: \(error)")
        }
    }
    
    func getStoreWithAlamofire() {
        service.fetchStoresWithStores { result in
            switch result {
            case .success(let stores):
                isLoading = false
                self.stores = stores
            case .failure(let error):
                isLoading = false
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
