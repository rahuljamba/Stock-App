//
//  StockListView.swift
//  Stock App
//
//  Created by Apple on 01/02/25.
//

import SwiftUI

struct StockListView: View {
    
    @State private var viewModel = StockListViewModel(manager: NetworkManager())
    
    var body: some View {
        
        VStack {
            
            Text("Stocks List")
                .font(.headline)
                .foregroundStyle(Color.gray)
                .frame(maxWidth: .infinity, alignment: .center)
            
            List{
                ForEach(viewModel.stockList, id: \.sid) { stock in
                    StockCellView(viewModel: viewModel, stock: stock)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            viewModel.startFetchingStock()
        }
    }
}

#Preview {
    StockListView()
}
