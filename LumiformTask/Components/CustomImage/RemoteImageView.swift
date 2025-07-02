//
//  RemoteImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

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
        imageView
            .frame(width: attributes.size?.width, height: attributes.size?.height)
            .sheet(isPresented: $isPresented) {
                FullscreenImageView(
                    attributes: .init(
                        url: attributes.url,
                        text: attributes.text
                    )
                )
            }
    }
    
    @ViewBuilder
    private var imageView: some View {
        switch loader.state {
        case .loading:
            ProgressView()
            
        case .failure:
            Image(systemName: UIStrings.SystemImage.systemPhoto)
                .resizable()
                .scaledToFit()
                .foregroundColor(.gray)
            
        case .success(let image):
            image
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    if attributes.showFullscreen {
                        isPresented = true
                    }
                }
        }
    }
}
