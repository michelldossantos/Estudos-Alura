//
//  NavigationBar.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 28/02/24.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button("R. Vergueiro, 3185") {
               //TODO: Action
            }.fontWeight(.semibold)
                .font(.subheadline)
                .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "bell.badge")
                    .foregroundColor(.red)
                    .font(.title3)
            }
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar().previewLayout(.sizeThatFits)

    }
}
