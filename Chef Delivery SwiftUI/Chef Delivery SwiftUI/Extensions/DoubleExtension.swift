//
//  DoubleExtension.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 14/03/24.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
}
