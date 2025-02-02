//
//  StockListViewModel.swift
//  Stock App
//
//  Created by Apple on 01/02/25.
//

import SwiftUI

@Observable
class StockListViewModel {
    
    private(set) var stockList: [StockDataModel] = []
    var dataManager: DataBaseManager
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
        self.dataManager = DataBaseManager(modelType: WishListStockModel.self)
    }
    
    func startFetchingStock() {
        Task {
            while true {
                await fetchAllStock()
                try? await Task.sleep(nanoseconds: AppConstant.fiveSeconds) // Wait 5 seconds
            }
        }
    }
    
    
    func fetchAllStock() async {
        do {
            
            let stockResponse = try await manager.makeApiRequest(StockModel.self, url: AppConstant.stockApiUrl)
            
            await MainActor.run {
                stockList = stockResponse.data
            }
        }catch let error as NetworkError {
            print(error.rawValue)
        }catch {
            print(error.localizedDescription)
        }
    }
    
    @MainActor func saveStockWishList(_ stock: StockDataModel) {
        
        if isStockExitInWishList(stock) {
            let stockModel: WishListStockModel = .init(sid: stock.sid, price: stock.price, close: stock.close, change: stock.change, high: stock.high, low: stock.low, volume: stock.volume, date: stock.date)
            self.dataManager.addItem(item: stockModel)
        }
    }
    
    @MainActor func isStockExitInWishList(_ stock: StockDataModel) -> Bool {
        let stockArray: [WishListStockModel] = self.dataManager.getItems()
        return stockArray.filter { $0.sid == stock.sid }.count == .zero
    }
    
}
