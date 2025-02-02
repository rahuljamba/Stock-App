//
//  WishStockCellView.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftUI

struct WishStockCellView: View {
    
    @Bindable var viewModel: WishListViewModel
    
    let stock: WishListStockModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(stock.sid)
                .font(.title2).bold()
            
            Text(stock.price.description)
                .font(.subheadline)

            Divider()
            
            VStack(alignment: .leading) {
                AddStockPricingView(placeholder: "Close", price: "\(stock.close)")
                AddStockPricingView(placeholder: "Change", price: "\(stock.change)")
                AddStockPricingView(placeholder: "High", price: "\(stock.high)")
                AddStockPricingView(placeholder: "Low", price: "\(stock.low)")
                AddStockPricingView(placeholder: "Volume", price: "\(stock.volume)")
            }

            Divider()
            
            AddStockPricingView(placeholder: "Date", price: stock.date.stockDate)
        }
        .padding()
            .frame(maxWidth: .infinity, minHeight: 100, alignment: .leading)
            .background(Color.smoke.gradient)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
    }
}

