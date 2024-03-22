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

    private enum CodingKeys: String, CodingKey {
        case id, name, location, stars, products
        case logoImage = "logo_image"
        case headerImage = "header_image"  
    }
}
