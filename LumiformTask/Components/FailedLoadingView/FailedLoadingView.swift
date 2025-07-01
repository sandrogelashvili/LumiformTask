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
        VStack(spacing: 8) {
            LocalImageView(
                source: .system("wifi.slash"),
                size: CGSize(width: 20, height: 20),
                color: .defaultBlack
            )
            
            CustomTextView(
                text: "No internet connection",
                style: .sectionTitle(level: 1),
                color: .defaultBlack
            )
            
            PrimaryButton(
                attribute: .init(
                    title: "Retry",
                    action: attribute.action
                )
            )
        }
    }
}
