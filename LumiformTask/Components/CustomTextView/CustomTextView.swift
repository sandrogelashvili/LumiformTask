//
//  CustomTextView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct CustomTextView: View {
    let text: String
    let style: TextStyle
    let color: Color

    var body: some View {
        Text(text)
            .font(style.font)
            .foregroundColor(color)
    }
}
