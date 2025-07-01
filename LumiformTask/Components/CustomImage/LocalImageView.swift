//
//  LocalImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct LocalImageView: View {
    let source: LocalImageSource
    let size: CGSize
    let color: Color
    
    var body: some View {
        imageView
            .resizable()
            .scaledToFit()
            .frame(width: size.width, height: size.height)
            .foregroundStyle(color)
    }
    
    private var imageView: Image {
        switch source {
        case .asset(let imageResource):
            return Image(imageResource)
        case .system(let name):
            return Image(systemName: name)
        }
    }
}

enum LocalImageSource {
    case asset(ImageResource)
    case system(String)
}
