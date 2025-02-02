//
//  StockModelData.swift
//  Stock App
//
//  Created by Apple on 01/02/25.
//


// MARK: - StockModelData
struct StockDataModel: Codable {
    let sid: String
    let price, close, change, high: Double
    let low: Double
    let volume: Int
    let date: String
}


