//
//  StoreType.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 13/03/24.
//

import Foundation

struct StoreType: Decodable, Identifiable {
    let id: Int
    let name: String
    let logoImage: String
    let headerImage: String
    let location: String
    let stars: Int
    let products: [ProductType]
}
