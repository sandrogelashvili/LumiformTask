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
            imageSize: CGSize? = CGSize(width: UIConstants.Size.s.width,
                                        height: UIConstants.Size.s.height),
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
            HStack(spacing: UIConstants.Spacing.s) {
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
            .padding(.horizontal, UIConstants.Padding.xxl)
            .padding(.vertical, UIConstants.Padding.m)
        }
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: UIConstants.CornerRadius.xl))
    }
}
