//
//  ImageView.swift
//  CombineFrameworkTutorial
//
//  Created by ramil on 20.04.2021.
//

import SwiftUI

struct ImageView: View {
    @StateObject var imageFetcher = ImageFetcher()
    
    var body: some View {
        VStack {
            Text("Select image to download")
            
            List(imageFetcher.urlPaths, id: \.self) { path in
                Button {
                    imageFetcher.loadImage.send(path)
                } label: {
                    Text(path)
                }
                
                ZStack {
                    Color.gray
                    
                    if imageFetcher.image != nil {
                        Image(uiImage: imageFetcher.image!)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                }
            }
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
