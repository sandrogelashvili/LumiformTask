//
//  FailedLoadingView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct FailedLoadingView: View {
    
    struct Attribute {
        let action: () -> Void
        
        init(action: @escaping () -> Void) {
            self.action = action
        }
    }
    
    let attribute: Attribute
    
    var body: some View {
        VStack(spacing: UIConstants.Spacing.s) {
            LocalImageView(
                source: .system(UIStrings.SystemImage.wifiSlash),
                size: CGSize(
                    width: UIConstants.Size.l.width,
                    height:  UIConstants.Size.l.height
                ),
                color: .defaultBlack
            )
            
            CustomTextView(
                text: UIStrings.Label.noInternet,
                style: .sectionTitle(level: 1),
                color: .defaultBlack
            )
            
            PrimaryButton(
                attribute: .init(
                    title: UIStrings.Button.retry,
                    action: attribute.action
                )
            )
        }
    }
}
