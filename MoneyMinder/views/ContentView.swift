//
//  ContentView.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var fromCurrency = ""
    @State private var toCurrency = ""
    @State private var convertedAmount = ""
    @State private var availableCurrencies = [String]()
    @State private var exchangeRates = [String: Double]()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Currency Converter")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            Image("currency-exchange")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            Text("Converted Amount")
                .font(.headline)
            
            Text(convertedAmount)
                .font(.title)
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Enter Amount to Convert")
                    .font(.headline)
                
                TextField("Enter amount", text: $amount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.decimalPad)
            }
            .padding(.horizontal)
            
            HStack {
                Text("From Currency")
                Spacer()
                Picker("From currency", selection: $fromCurrency) {
                    ForEach(availableCurrencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            HStack {
                Text("To Currency")
                Spacer()
                Picker("To currency", selection: $toCurrency) {
                    ForEach(availableCurrencies, id: \.self) { currency in
                        Text(currency)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            
            Button(action: {
                convertCurrency()
            }) {
                Text("Convert")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .onAppear {
            fetchCurrencies()
        }
    }
    
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
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                convertedAmount = "Error fetching data: \(error?.localizedDescription ?? "Unknown error")"
                return
            }
            
            // Parse JSON response
            do {
                let decodedResponse = try JSONDecoder().decode(LatestResponse.self, from: data)
                guard let rates = decodedResponse.data[toCurrency] else {
                    convertedAmount = "Exchange rate not available for \(toCurrency)"
                    return
                }
                convertedAmount = "\(amount * rates)"
            } catch {
                convertedAmount = "Error decoding response: \(error.localizedDescription)"
            }
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Struct to represent JSON response
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

    


#Preview {
    ContentView()
}
