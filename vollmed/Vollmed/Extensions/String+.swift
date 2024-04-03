//
//  String+.swift
//  Vollmed
//
//  Created by Michel Santos on 02/04/24.
//

import Foundation

extension String {
    func converterDateStringToReadableDate() -> Self {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        if let date = inputFormatter.date(from: self) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy 'às' HH:mm"
            return dateFormatter.string(from: date)
        }
        
        return String()
    }
}
