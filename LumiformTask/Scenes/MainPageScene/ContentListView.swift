//
//  ContentListView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct ContentListView: View {
    let item: ContentItem
    let sectionLevel: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            CustomTextView(
                text: item.title,
                style: .for(item: item, level: sectionLevel),
                color: .primary
            )

            switch item.type {
            case .text:
                EmptyView()
            case .image:
                if let src = item.src, let url = URL(string: src) {
                    RemoteImageView(url: url, size: CGSize(width: 150, height: 150), showFullscreen: true)
                }
            case .section, .page:
                if let children = item.items {
                    ForEach(children.indices, id: \.self) { idx in
                        ContentListView(
                            item: children[idx],
                            sectionLevel: item.type == .section ? sectionLevel + 1 : 1
                        )
                        .padding(.leading, 16)
                    }
                }
            }
        }
        .padding(.vertical, 4)
    }
}
