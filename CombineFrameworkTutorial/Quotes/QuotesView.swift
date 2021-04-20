//
//  QuotesView.swift
//  CombineFrameworkTutorial
//
//  Created by ramil on 20.04.2021.
//

import SwiftUI

struct QuotesView: View {
    @StateObject var quotesFetcher = QuoteFetcher()
    
    var body: some View {
        VStack {
            Text("Quotes")
                .font(.title)
            
            List(quotesFetcher.quotes, id: \.self) { quote in
                VStack(alignment: .trailing) {
                    Text(quote.quoteText)
                    Text(quote.author)
                        .bold()
                }
            }
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
