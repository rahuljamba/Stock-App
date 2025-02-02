//
//  AddStockPricingView.swift
//  Stock App
//
//  Created by Apple on 03/02/25.
//

import SwiftUI

struct AddStockPricingView: View {
    
    let placeholder: String
    let price: String
    
    var body: some View {
        Text("\(placeholder): ") + Text(price)
            .font(.body).bold()
    }
}

