//
//  FieldView.swift
//  Vollmed
//
//  Created by Michel Santos on 10/04/24.
//

import SwiftUI
import UIKit

struct FieldView: View {
    @Binding  var text: String
    let placeHolder: String
    let keyboardType: UIKeyboardType
    let autocorrection: Bool
    let isSecure: Bool
    

    init(text: Binding<String>, placeHolder: String, keyboardType: UIKeyboardType = .default, autocorrection: Bool = true, isSecure: Bool = false) {
        _text = text
        self.placeHolder = placeHolder
        self.keyboardType = keyboardType
        self.autocorrection = autocorrection
        self.isSecure = isSecure
    }

    
    func createField() -> some View {
        return Group {
            if isSecure {
                SecureField(placeHolder, text: $text)
            } else {
                TextField(placeHolder, text: $text)
            }
        }
        .padding()
        .bold()
        .background(Color.gray.opacity(0.25))
        .cornerRadius(14.0)
        .keyboardType(keyboardType)
        .autocorrectionDisabled(autocorrection)
    }
    
    var body: some View {
        createField()
    }
}

#Preview {
    FieldView(text: Binding.constant(""), placeHolder: "Digite algo", keyboardType: .default, autocorrection: true, isSecure: false)
}
