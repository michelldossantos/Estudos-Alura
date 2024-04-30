//
//  RedactedAnimationModifier.swift
//  Vollmed
//
//  Created by Michel Santos on 29/04/24.
//

import Foundation
import SwiftUI

struct RedactedAnimationModifier: ViewModifier {
    @State private var isRedacted = true
    func body(content: Content) -> some View {
        content.opacity(isRedacted ? 0 : 1)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.7).repeatForever(autoreverses: true)) {
                    self.isRedacted.toggle()
                }
            }
            .transition(.move(edge: .trailing))

    }
}


extension View {
    func redactedAnimation() -> some  View {
        modifier(RedactedAnimationModifier())
    }
}
