//
//  UIAplication+.swift
//  Vollmed
//
//  Created by Michel Santos on 27/04/24.
//

import UIKit

extension UIApplication {
    var getKeyWindow: UIWindow? {
        return self.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
