// CurrencyConverterViewModel.swift

import Foundation

import SwiftUI

class CurrencyViewModel: ObservableObject {
    @Published var amount = ""
    @Published var fromCurrency = ""
    @Published var toCurrency = ""
    @Published var convertedAmount = ""
    @Published var availableCurrencies = [String]()

    func fetchCurrencies() {
        let apiUrl = "https://api.freecurrencyapi.com/v1/currencies?apikey=fca_live_3vJ4Msf2ZYtG6BMOBE5aT0H4Qw7FE2xGmgWBiPs3"

        guard let url = URL(string: apiUrl) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(CurrencyResponse.self, from: data)
                let currencies = decodedResponse.data.keys.sorted()

                DispatchQueue.main.async {
                    self.availableCurrencies = currencies
                    // Set default currencies if needed
                    if self.fromCurrency.isEmpty {
                        self.fromCurrency = currencies.first ?? ""
                    }
                    if self.toCurrency.isEmpty {
                        self.toCurrency = currencies.last ?? ""
                    }
                }
            } catch {
                print("Error decoding currencies: \(error)")
            }
        }.resume()
    }

    func convertCurrency() {
        guard let amount = Double(amount) else {
            convertedAmount = "Invalid amount"
            return
        }

        // Construct the API URL
        let apiUrl = "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_3vJ4Msf2ZYtG6BMOBE5aT0H4Qw7FE2xGmgWBiPs3&base_currency=\(fromCurrency)"

        // Make the API request
        guard let url = URL(string: apiUrl) else {
            convertedAmount = "Invalid URL"
            return
        }

        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            guard let data = data else {
                self.convertedAmount = "Error fetching data: \(error?.localizedDescription ?? "Unknown error")"
                return
            }

            // Parse JSON response
            do {
                let decodedResponse = try JSONDecoder().decode(LatestResponse.self, from: data)
                guard let rates = decodedResponse.data[toCurrency] else {
                    self.convertedAmount = "Exchange rate not available for \(toCurrency)"
                    return
                }
                DispatchQueue.main.async {
                    self.convertedAmount = "\(amount * rates)"
                }
            } catch {
                DispatchQueue.main.async {
                    self.convertedAmount = "Error decoding response: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}

