//
//  ContentView.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/26/24.
//

// ContentView.swift

import SwiftUI


struct ContentView: View {
    @StateObject private var viewModel = CurrencyViewModel()
    let customColor = Color(hue: 39.4 / 360, saturation: 0.9222, brightness: 0.6471)
    
    var body: some View {
        
                VStack(spacing: 30) {
                    Text("Currency Converter")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Image("currency-exchange")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    
                    Text("Converted Amount")
                        .font(.headline)
                        .foregroundColor(.white)
                    
                    Text(viewModel.convertedAmount)
                        .font(.title)
                        .foregroundColor(.white)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Enter Amount to Convert")
                            .font(.headline)
                            .foregroundColor(.green)
                        
                        TextField("Enter amount", text: $viewModel.amount)
                            .padding()
                            .background(Color.white.opacity(0.5))
                            .cornerRadius(10)
                            .keyboardType(.decimalPad)
                    }
                    .padding(.horizontal)
                    
                    HStack {
                        Text("From Currency")
                            .foregroundColor(.green)
                        Spacer()
                        Picker("From currency", selection: $viewModel.fromCurrency) {
                            ForEach(viewModel.availableCurrencies, id: \.self) { currency in
                                Text(currency).tag(currency)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    HStack {
                        Text("To Currency")
                            .foregroundColor(.green)
                        Spacer()
                        Picker("To currency", selection: $viewModel.toCurrency) {
                            ForEach(viewModel.availableCurrencies, id: \.self) { currency in
                                Text(currency).tag(currency)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                    }
                    
                    Button(action: {
                        viewModel.convertCurrency()
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
                    viewModel.fetchCurrencies()
                }
            
    }
}




#Preview {
    ContentView()
}
