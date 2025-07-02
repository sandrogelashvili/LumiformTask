//
//  UIConstants.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 02.07.25.
//

import SwiftUI

enum UIConstants {
    
    enum Padding {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 12
        static let l: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 28
    }
    
    enum CornerRadius {
        static let s: CGFloat = 4
        static let m: CGFloat = 8
        static let l: CGFloat = 16
        static let xl: CGFloat = 24
    }
    
    enum Spacing {
        static let xs: CGFloat = 4
        static let s: CGFloat = 8
        static let m: CGFloat = 12
        static let l: CGFloat = 16
        static let xl: CGFloat = 24
    }

    enum Size {
        static let xs = CGSize(width: 12, height: 12)
        static let s = CGSize(width: 14, height: 14)
        static let m = CGSize(width: 18, height: 18)
        static let l = CGSize(width: 24, height: 24)
        static let xl = CGSize(width: 32, height: 32)
        
        static let xmarkCustomSize = CGSize(width: 80, height: 80)
        static let remoteImageSize = CGSize(width: 150, height: 150)
    }
    
    enum Duration {
        static let short: TimeInterval = 0.2
        static let medium: TimeInterval = 0.5
        static let long: TimeInterval = 1.0
    }
}

