//
//  RemoteImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct RemoteImageView: View {
    let url: URL
    let size: CGSize?
    let showFullscreen: Bool

    @StateObject private var loader: RemoteImageLoader
    @State private var isPresented = false

    init(url: URL, size: CGSize? = nil, showFullscreen: Bool = true) {
        self.url = url
        self.size = size
        self.showFullscreen = showFullscreen
        _loader = StateObject(wrappedValue: RemoteImageLoader(url: url))
    }

    var body: some View {
        Group {
            switch loader.state {
            case .loading:
                ProgressView()
                    .frame(width: size?.width, height: size?.height)

            case .failure:
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .frame(width: size?.width, height: size?.height)

            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size?.width, height: size?.height)
                    .onTapGesture {
                        if showFullscreen {
                            isPresented = true
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresented) {
            FullscreenImageView(url: url)
        }
    }
}
