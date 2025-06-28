//
//  LocalImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct LocalImageView: View {
    let image: ImageResource
    let size: CGSize
    let color: Color

    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .frame(width: size.width, height: size.height)
            .foregroundStyle(color)
    }
}
