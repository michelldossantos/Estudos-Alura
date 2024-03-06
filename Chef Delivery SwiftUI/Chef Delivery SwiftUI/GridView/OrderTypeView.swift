//
//  OrderTypeView.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 05/03/24.
//

import SwiftUI

struct OrderTypeView: View {
    let orderType: OrderType
    var body: some View {
        VStack {
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: true)
            Text(orderType.name)
                .font(.system(size: 10))
        }.frame(width: 70, height: 100)
    }
}

struct OrderTypeView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeView(orderType: ordersMock[0]).previewLayout(.sizeThatFits)
    }
}
