//
//  QuoteFetcher.swift
//  CombineFrameworkTutorial
//
//  Created by ramil on 20.04.2021.
//

import Foundation
import Combine

class QuoteFetcher: ObservableObject {
    
    let fileNames = ["quote1", "quote2", "quote3"]
    
    @Published var quotes = [QuoteModel]()
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        fileNames.publisher
            .compactMap { fileName -> URL? in
                Bundle.main.url(forResource: fileName, withExtension: "json")
            }
            .tryMap { (url) -> Data in
                try Data(contentsOf: url)
            }
            .decode(type: QuoteModel.self, decoder: JSONDecoder())
            .sink { (completion) in
                print("completion with \(completion)")
            } receiveValue: { [unowned self] (quote) in
                self.quotes.append(quote)
            }.store(in: &subscriptions)

    }
}
