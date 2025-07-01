//
//  RemoteImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct RemoteImageView: View {
    
    struct Attribute {
        let text: String
        let url: URL
        let size: CGSize?
        let showFullscreen: Bool
        
        init(
            text: String,
            url: URL,
            size: CGSize? = nil,
            showFullscreen: Bool = true
        ) {
            self.text = text
            self.url = url
            self.size = size
            self.showFullscreen = showFullscreen
        }
    }
    
    let attributes: Attribute
    @StateObject private var loader: RemoteImageLoader
    @State private var isPresented = false
    
    init(attributes: Attribute) {
        self.attributes = attributes
        _loader = StateObject(wrappedValue: RemoteImageLoader(url: attributes.url))
    }
    
    var body: some View {
        Group {
            switch loader.state {
            case .loading:
                ProgressView()
                    .frame(width: attributes.size?.width, height: attributes.size?.height)
                
            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: attributes.size?.width, height: attributes.size?.height)
                
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: attributes.size?.width, height: attributes.size?.height)
                    .onTapGesture {
                        if attributes.showFullscreen {
                            isPresented = true
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresented) {
            FullscreenImageView(
                attributes: .init(
                    url: attributes.url,
                    text: attributes.text
                )
            )
        }
    }
}
