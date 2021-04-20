//
//  ImageFetcher.swift
//  CombineFrameworkTutorial
//
//  Created by ramil on 20.04.2021.
//

import Foundation
import Combine
import SwiftUI

class ImageFetcher: ObservableObject {
    let urlPaths = [
        "https://via.placeholder.com/600/771796",
        "https://via.placeholder.com/150/d32776",
        "https://via.placeholder.com/150/d66b97",
    ]
    
    @Published var image: UIImage? = nil
    
    let loadImage = CurrentValueSubject<String, Never>("")
    
    var subscriptions = Set<AnyCancellable>()
    
    init() {
        loadImage.sink { [unowned self] _ in
            self.image = nil
        }.store(in: &subscriptions)
        
        loadImage
            .removeDuplicates()
            .compactMap {
                URL(string: $0)
            }
            .map { (url) in
                URLSession.shared.dataTaskPublisher(for: url)
                    .map(\.data)
                    .compactMap {
                        UIImage(data: $0)
                        
                    }
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("completion")
            } receiveValue: { [unowned self] (image) in
                self.image = image
            }.store(in: &subscriptions)
    }
}
