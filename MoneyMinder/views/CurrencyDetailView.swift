//
//  CurrencyDetailView.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/28/24.
//

import SwiftUI

struct CurrencyDetailView: View {
    let currency: Currency
    
    var body: some View {
        VStack(spacing: 20) {
            Text(currency.code)
                .font(.title)
                .fontWeight(.bold)
            
            Text(currency.name)
                .font(.headline)
                .foregroundColor(.secondary)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Rate")
                    .font(.headline)
                Text("\(currency.rate, specifier: "%.4f")")
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Symbol")
                    .font(.headline)
                Text(currency.symbol)
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
    }
}


