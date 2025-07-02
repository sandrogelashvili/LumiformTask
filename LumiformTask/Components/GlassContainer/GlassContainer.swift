//
//  GlassContainer.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 02.07.25.
//

import SwiftUI

struct GlassContainer<Content: View>: View {
    let content: Content
    let cornerRadius: CGFloat
    let padding: CGFloat

    init(
        cornerRadius: CGFloat = 16,
        padding: CGFloat = 16,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.cornerRadius = cornerRadius
        self.padding = padding
    }

    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(.ultraThinMaterial)
            )
            .padding(.horizontal, padding)
            .padding(.vertical, 8)
    }
}
