//
//  TabBarView.swift
//  MoneyMinder
//
//  Created by fahad samara on 2/29/24.
//

import SwiftUI


struct TabBarView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.purple.opacity(0.6)]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            TabView {
                ContentView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                    }
                
                CurrencyListView()
                    .tabItem {
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Currency")
                    }
            }
            .accentColor(.green)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
