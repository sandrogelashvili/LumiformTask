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
    
    @State private var isExpanded: Bool
    
    init(item: ContentItem, sectionLevel: Int = 1) {
        self.item = item
        self.sectionLevel = sectionLevel
        self._isExpanded = State(initialValue: item.type != .section)
    }
    
    var body: some View {
        Group {
            if shouldWrapInGlass {
                GlassContainer {
                    contentBody
                }
            } else {
                contentBody
            }
        }
        .padding(.vertical, UIConstants.Padding.s)
    }
    
    private var contentBody: some View {
        VStack(alignment: .leading, spacing: UIConstants.Spacing.s) {
            headerView
            
            if isExpanded {
                if let children = item.items {
                    ForEach(children.indices, id: \.self) { idx in
                        ContentListView(
                            item: children[idx],
                            sectionLevel: item.type == .section ? sectionLevel + 1 : 1
                        )
                        .padding(.leading, UIConstants.Padding.m)
                    }
                }
            }
        }
    }
    
    private var headerView: some View {
        HStack {
            titleView
            
            Spacer()
            
            if item.type == .section {
                LocalImageView(
                    source: .system(
                        isExpanded ? UIStrings.SystemImage.chevronDown : UIStrings.SystemImage.chevronRight
                    ),
                    size: CGSize(width: UIConstants.Size.s.width, height: UIConstants.Size.s.height),
                    color: .gray
                )
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            guard item.type == .section else { return }
            withAnimation {
                isExpanded.toggle()
            }
        }
    }
    
    private var titleView: some View {
        Group {
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
                            size: CGSize(
                                width: UIConstants.Size.remoteImageSize.width,
                                height: UIConstants.Size.remoteImageSize.height
                            ),
                            showFullscreen: true
                        )
                    )
                }
            case .page:
                EmptyView()
            }
        }
    }
    
    private var shouldWrapInGlass: Bool {
        item.type == .section && sectionLevel == 1
    }
}
