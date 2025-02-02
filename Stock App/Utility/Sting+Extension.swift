//
//  Sting+Extension.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import Foundation

extension String {
    var stockDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self) ?? Date()
        
        dateFormatter.dateFormat = "MM/dd/yyyy hh:mm a"
        
        return dateFormatter.string(from: date)
    }
}
