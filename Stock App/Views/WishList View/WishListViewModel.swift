//
//  WishListViewModel.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftUI

@Observable
class WishListViewModel {
    
    var showAlertView: Bool = false
    
    private(set) var wishStockList: [WishListStockModel] = []
    var deleteWishStock: WishListStockModel?
    
    var manager: DataBaseManager
    
    init() {
        self.manager = DataBaseManager(modelType: WishListStockModel.self)
    }
    
    @MainActor func fetchWishStockList() {
        wishStockList = manager.getItems()
    }
    
    @MainActor func deleteWishListStock(_ item: WishListStockModel) {
        manager.deleteItem(item: item)
        fetchWishStockList()
    }
    
}
