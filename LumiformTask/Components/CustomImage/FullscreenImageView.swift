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
        
        init(
            url: URL,
            text: String
        ) {
            self.url = url
            self.text = text
        }
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
            Color(.defaultWhite)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    CustomTextView(
                        text: attributes.text,
                        style: .sectionTitle(level: 2),
                        color: .defaultBlack
                    )
                    
                    Spacer()
                    
                    Button(action: {
                        dismiss()
                    }) {
                        LocalImageView(
                            source: .asset(.closeXmark),
                            size: CGSize(width: 20, height: 20),
                            color: .defaultBlack
                        )
                        .padding(8)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(Circle())
                    }
                }
                .padding()
                
                Spacer()
                
                switch loader.state {
                case .loading:
                    ProgressView()
                        .scaleEffect(1.5)
                case .failure:
                    Image(systemName: "xmark.octagon")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.red)
                        .frame(width: 80, height: 80)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
                
                Spacer()
            }
        }
    }
}
