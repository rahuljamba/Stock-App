//
//  DashboardView.swift
//  Stock App
//
//  Created by Apple on 02/02/25.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        TabView {
            
            StockListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            
            
            WishListView()
                .tabItem {
                    Label("Wish", systemImage: "bookmark")
                }
            
        }
    }
}

#Preview {
    DashboardView()
}
