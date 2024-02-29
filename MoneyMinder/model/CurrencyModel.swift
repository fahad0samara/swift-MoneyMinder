// CurrencyResponse.swift

import Foundation

struct CurrencyResponse: Codable {
    let data: [String: CurrencyInfo]
}

struct CurrencyInfo: Codable {
    let symbol: String
    let name: String
    let symbol_native: String
    let decimal_digits: Int
    let rounding: Int
    let code: String
    let name_plural: String
    let type: String
}

struct LatestResponse: Codable {
    let data: [String: Double]
}
