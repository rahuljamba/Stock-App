//
//  WishListView.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftUI

struct WishListView: View {
    
    @State private var viewModel = WishListViewModel()
    
    var body: some View {
        
        VStack {
            
            if viewModel.wishStockList.isEmpty {
                
                ContentUnavailableView("Stock Wish list is empty", systemImage: "singaporedollarsign")
                
            }else {
                Text("Wish Stock List")
                    .font(.headline)
                    .foregroundStyle(Color.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                List{
                    ForEach(viewModel.wishStockList, id: \.sid) { stock in
                        WishStockCellView(viewModel: viewModel, stock: stock)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
            }
        }
        .alert(isPresented: $viewModel.showAlertView) {
            Alert(title: Text("Are you sure ?"), message: Text("This item is permanent remove from your wish list."), primaryButton: .default(Text("Cancel")), secondaryButton: .default(Text("Delete"), action: {
                viewModel.deleteWishListStock(viewModel.deleteWishStock!)
            }))
        }
        .onAppear {
            viewModel.fetchWishStockList()
        }
    }
}


