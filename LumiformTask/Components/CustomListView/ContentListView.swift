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
    
    init(item: ContentItem, sectionLevel: Int = 1) {
        self.item = item
        self.sectionLevel = sectionLevel
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            switch item.type {
            case .text, .section:
                CustomTextView(
                    text: item.title,
                    style: .for(item: item, level: sectionLevel),
                    color: .defaultBlack
                )
                
            case .image:
                if let src = item.src, let url = URL(string: src) {
                    RemoteImageView(
                        attributes: .init(
                            text: item.title,
                            url: url,
                            size:  CGSize(width: 150, height: 150),
                            showFullscreen: true
                        )
                    )
                }
                
                CustomTextView(
                    text: item.title,
                    style: .for(item: item, level: sectionLevel),
                    color: .defaultBlack
                )
                
            case .page:
                EmptyView()
            }
            
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
        .padding(.vertical, 4)
    }
}
