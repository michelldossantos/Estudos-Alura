//
//  TextDefaultView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI

struct TextDefaultView: View {
    let text: String
    let font: Font
    let isBold: Bool
    let foreGroundColor: Color
    
    init(
        text: String,
        font: Font = .title3,
        isBold: Bool = true,
        foreGroundColor: Color = .accentColor
    ) {
        self.text = text
        self.font = font
        self.isBold = isBold
        self.foreGroundColor = foreGroundColor
    }
    
    var body: some View {
        Text(text)
            .font(font)
            .bold(isBold)
            .foregroundStyle(foreGroundColor)
    }
}

#Preview {
    TextDefaultView(text: "Teste", isBold: true)
}
