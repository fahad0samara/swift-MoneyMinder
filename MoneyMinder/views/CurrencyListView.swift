//
//  CurrencyListView.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/27/24.
//

import SwiftUI




struct CurrencyListView: View {
    @StateObject private var viewModel = CurrencyListViewModel()
    @State private var isRefreshing = false
    
    var body: some View {
        NavigationView {
            List(viewModel.currencies, id: \.code) { currency in
                NavigationLink(destination: CurrencyDetailView(currency: currency)) {
                    CurrencyRow(currency: currency)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarTitle("Currency Rates")
            .overlay(refreshControl)
        }
        .onAppear {
            viewModel.fetchCurrencies()
        }
    }
    
    private var refreshControl: some View {
        ScrollView {
            VStack {
                if isRefreshing {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .offset(y: -20)
                        .padding(.bottom, -20)
                }
            }
        }
        .frame(height: 0)
        .background(
           
        )
        .coordinateSpace(name: "pullToRefresh")
        .onPreferenceChange(RefreshKey.self) { value in
            withAnimation {
                isRefreshing = value
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                viewModel.fetchCurrencies()
            }
        }
    }
}

struct CurrencyRow: View {
    let currency: Currency
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(currency.code)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Text(currency.name)
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            Spacer()
            Text("\(currency.rate, specifier: "%.4f")")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct RefreshKey: PreferenceKey {
    static var defaultValue: Bool = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) {}
}

