//
//  FullScreenImageView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct FullscreenImageView: View {
    
    struct Attribute {
        let url: URL
        let text: String
    }
    
    let attributes: Attribute
    @Environment(\.dismiss) private var dismiss
    @StateObject private var loader: RemoteImageLoader
    
    init(attributes: Attribute) {
        self.attributes = attributes
        _loader = StateObject(wrappedValue: RemoteImageLoader(url: attributes.url))
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(.defaultWhite).ignoresSafeArea()
            
            VStack {
                header
                
                Spacer()
                
                imageContent
                
                Spacer()
            }
            .padding()
        }
    }
    
    private var header: some View {
        HStack {
            CustomTextView(
                text: attributes.text,
                style: .sectionTitle(level: 2),
                color: .defaultBlack
            )
            
            Spacer()
            
            Button(action: {
                dismiss()
            }, label: {
                LocalImageView(
                    source: .asset(.closeXmark),
                    size: CGSize(
                        width: UIConstants.Size.xl.width,
                        height: UIConstants.Size.xl.height
                    ),
                    color: .defaultBlack
                )
                .padding(UIConstants.Padding.s)
                .background(Color.gray.opacity(0.2))
                .clipShape(Circle())
            })
        }
    }
    
    @ViewBuilder
    private var imageContent: some View {
        switch loader.state {
        case .loading:
            ProgressView()
                .scaleEffect(1.5)
            
        case .failure:
            LocalImageView(
                source: .system("xmark.octagon"),
                size: CGSize(
                    width: UIConstants.Size.xl.width,
                    height: UIConstants.Size.xl.height
                ),
                color: .red
            )
            
        case .success(let image):
            image
                .resizable()
                .scaledToFit()
                .padding()
        }
    }
}
