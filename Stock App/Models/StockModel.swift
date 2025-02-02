//
//  StockModel.swift
//  Stock App
//
//  Created by Apple on 01/02/25.
//

import Foundation

// MARK: - StockModel
struct StockModel: Decodable {
    let success: Bool
    let data: [StockDataModel]
}


