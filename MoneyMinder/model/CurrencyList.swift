//
//  CurrencyList.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/27/24.
//



import Foundation

struct Currency: Identifiable {
    let id = UUID()
    let code: String
    let rate: Double
    let name: String
    let symbol: String
    let rounding: Int
    let type: String
}
struct CurrencyData: Codable {
    let data: [String: Double]
}

struct CurrencyDetailData: Codable {
    let data: [String: CurrencyDetail]
}


struct CurrencyDetail: Codable {
    let name: String
    let symbol: String
    let symbol_native: String
    let decimal_digits: Int
    let rounding: Int
    let code: String
    let name_plural: String
    let type: String
}
