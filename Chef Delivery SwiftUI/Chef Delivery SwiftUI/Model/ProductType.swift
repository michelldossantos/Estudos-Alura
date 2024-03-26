//
//  ProductType.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 13/03/24.
//

import Foundation

struct ProductType: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    
    var formattedPrice: String {
        return "R$" + price.formatPrice()
    }
}
