//
//  PrimaryButton.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct PrimaryButton: View {

    struct Attribute {
        let image: LocalImageSource?
        let imageSize: CGSize?
        let title: String
        let action: () -> Void

        init(
            image: LocalImageSource? = nil,
            imageSize: CGSize? = CGSize(width: 14, height: 14),
            title: String,
            action: @escaping () -> Void
        ) {
            self.image = image
            self.imageSize = imageSize
            self.title = title
            self.action = action
        }
    }

    let attribute: Attribute

    var body: some View {
        Button(action: attribute.action) {
            HStack(spacing: 8) {
                CustomTextView(
                    text: attribute.title,
                    style: .questionText,
                    color: .white
                )

                if let image = attribute.image, let size = attribute.imageSize {
                    LocalImageView(
                        source: image,
                        size: size,
                        color: .white
                    )
                }
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 12)
        }
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
