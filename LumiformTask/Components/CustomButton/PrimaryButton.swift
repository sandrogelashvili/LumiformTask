//
//  PrimaryButton.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

struct PrimaryButton: View {
    
    struct Attribute {
        let image: ImageResource
        let title: String
        let action: () -> Void
        
        init(
            image: ImageResource,
            title: String,
            action: @escaping () -> Void
        ) {
            self.image = image
            self.title = title
            self.action = action
        }
    }
    
    let attribute: Attribute
    
    var body: some View {
        Button {
            attribute.action()
        } label: {
            HStack (spacing: 8){
                CustomTextView(
                    text: attribute.title,
                    style: .questionText,
                    color: .white
                )
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 14, height: 14)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 28)
            .padding(.vertical, 12.5)
        }
        .background(.blue)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}
