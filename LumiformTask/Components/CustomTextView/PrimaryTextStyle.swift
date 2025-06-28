//
//  PrimaryTextStyle.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

enum TextStyle {
    case pageTitle
    case sectionTitle(level: Int)
    case questionText

    var font: Font {
        switch self {
        case .pageTitle:
            return .system(size: 28, weight: .heavy)

        case .sectionTitle(let level):
            switch level {
            case 1: return .system(size: 24, weight: .medium)
            case 2: return .system(size: 18, weight: .medium)
            default: return .system(size: 16, weight: .regular)
            }

        case .questionText:
            return .system(size: 14, weight: .regular)
        }
    }
}

extension TextStyle {
    static func `for`(item: ContentItem, level: Int) -> TextStyle {
        switch item.type {
        case .page:
            return .pageTitle
        case .section:
            return .sectionTitle(level: level)
        case .text, .image:
            return .questionText
        }
    }
}
