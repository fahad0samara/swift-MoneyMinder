import Foundation

class CurrencyListViewModel: ObservableObject {
    @Published var currencies: [Currency] = []
    
    func fetchCurrencies() {
        guard let url = URL(string: "https://api.freecurrencyapi.com/v1/latest?apikey=fca_live_3vJ4Msf2ZYtG6BMOBE5aT0H4Qw7FE2xGmgWBiPs3") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(CurrencyData.self, from: data) {
                let currencies = decodedResponse.data.map { (code, rate) in
                    Currency(code: code, rate: rate, name: "", symbol: "", rounding: 0, type: "")
                }
                self?.fetchCurrencyDetails(for: currencies)
            } else {
                print("Failed to decode response")
            }
        }.resume()
    }

    
    private func fetchCurrencyDetails(for currencies: [Currency]) {
        let currencyCodes = currencies.map { $0.code }.joined(separator: ",")
        let urlString = "https://api.freecurrencyapi.com/v1/currencies?apikey=fca_live_3vJ4Msf2ZYtG6BMOBE5aT0H4Qw7FE2xGmgWBiPs3&currencies=\(currencyCodes)"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let decodedResponse = try? JSONDecoder().decode(CurrencyDetailData.self, from: data) {
                let updatedCurrencies = currencies.map { currency -> Currency in
                    guard let currencyDetail = decodedResponse.data[currency.code] else { return currency }
                    return Currency(
                        code: currency.code,
                        rate: currency.rate,
                        name: currencyDetail.name,
                        symbol: currencyDetail.symbol,
                        rounding: currencyDetail.rounding,
                        type: currencyDetail.type
                    )
                }
                DispatchQueue.main.async {
                    self?.currencies = updatedCurrencies
                }
            } else {
                print("Failed to decode response")
            }
        }.resume()
    }
}
