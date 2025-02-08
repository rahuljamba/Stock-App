//
//  StockCellView.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftUI

struct StockCellView: View {
    
    @Bindable var viewModel: StockListViewModel
    @State private var isBookmark: Bool = false
    let stock: StockDataModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(stock.sid)
                    .font(.title2).bold()
                
                Text(stock.price.description)
                    .font(.subheadline)
            
                Spacer()
                
                Button {
                    if !isBookmark {
                        isBookmark = true
                        viewModel.saveStockWishList(stock)
                    }
                } label: {
                    Image(systemName: isBookmark ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 10, height: 5)
                }
                
            }
            
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
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color.green.opacity(1.5), Color.smoke]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal, 10)
            
    }
}
