//
//  ContentView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct ContentView: View {
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
            fetchStores()
            

        }
    }

    func fetchStores() {
        guard let url = URL(string: "AddURL") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([StoreType].self, from: data) {
                    DispatchQueue.main.async {
                        storesAPI = decodedResponse
                    }
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()  
        

    
    }   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.sizeThatFits)
    }
}
