//
//  WishListStockModel.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftData
import Foundation

@Model
final class WishListStockModel {
    
    var sid: String
    var price: Double
    var close: Double
    var change: Double
    var high: Double
    var low: Double
    var volume: Int
    var date: String
    var timestamp: Date
    
    init(sid: String, price: Double, close: Double, change: Double, high: Double, low: Double, volume: Int, date: String, timestamp: Date = .now) {
        self.sid = sid
        self.price = price
        self.close = close
        self.change = change
        self.high = high
        self.low = low
        self.volume = volume
        self.date = date
        self.timestamp = timestamp
    }
}
