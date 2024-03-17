//
//  DistanceMenu.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 17/03/24.
//

import SwiftUI

enum Distance: Int, CaseIterable {
    case one = 1
    case five = 5
    case ten = 10
    case twenty = 20
}

struct DistanceMenu: View {
    var body: some View {
        Menu("Distâncias") {
            ForEach(Distance.allCases, id: \.self) { distance in
                DistanceButton(distance: distance)
            }
        }
    }
}

struct DistanceMenu_Previews: PreviewProvider {
    static var previews: some View {
        DistanceMenu()
    }
}

struct DistanceButton: View {
    let distance: Distance

    var body: some View {
        Button(action: {
                //TODO: Action
        }) {
            Text("Até \(distance.rawValue) km")
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
