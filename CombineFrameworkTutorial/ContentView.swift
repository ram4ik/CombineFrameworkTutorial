//
//  ContentView.swift
//  CombineFrameworkTutorial
//
//  Created by ramil on 20.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuotesView()
                .tabItem {
                    Image(systemName: "quote.bubble")
                    Text("Quotes")
                }
            
            ImageView()
                .tabItem {
                    Image(systemName: "esim")
                    Text("Images")
                }
        }.accentColor(.secondary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
