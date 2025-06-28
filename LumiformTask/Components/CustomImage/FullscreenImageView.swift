//
//  FullScreenImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//


import SwiftUI

struct FullscreenImageView: View {
    let url: URL

    @StateObject private var loader: RemoteImageLoader

    init(url: URL) {
        self.url = url
        _loader = StateObject(wrappedValue: RemoteImageLoader(url: url))
    }

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            switch loader.state {
            case .loading:
                ProgressView()
            case .failure:
                Image(systemName: "xmark.octagon")
                    .foregroundColor(.red)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
        }
    }
}
