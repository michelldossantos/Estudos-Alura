//
//  RatingMenu.swift
//  Chef Delivery SwiftUI
//
//  Created by Michel Santos on 17/03/24.
//

import SwiftUI

struct RatingMenu: View {
    @State private var ratingFilter = 0
    
    var body: some View {
        Menu("Filtrar") {
            Button {
                ratingFilter = 0
            } label: {
                Text("Limpar Filtro")
            }
            Divider()
            
            ForEach(1...5, id: \.self) { rating in
                Button {
                    ratingFilter = rating
                } label: {
                    if rating > 1 {
                        Text("\(rating) estralas ou mais")
                    } else {
                        Text("\(rating) estrala ou mais")
                        
                    }
                }
                
            }
        }

    }
}

struct RatingMenu_Previews: PreviewProvider {
    static var previews: some View {
        RatingMenu()
    }
}
