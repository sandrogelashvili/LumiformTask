//
//  UIStrings.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 02.07.25.
//

import Foundation

enum UIStrings {
    enum Button {
        static let secondPage = "Second page"
        static let retry = "Retry"
        static let ok = "OK"
    }

    enum Alert {
        static let errorTitle = "Error"
        static let genericError = "Something went wrong."
        static let unknownError = "Unknown error"
    }

    enum Label {
        static let noInternet = "No internet connection"
        static let loading = "Loading..."
    }
    
    enum SystemImage {
        static let xmarkOctagon = "xmark.octagon"
        static let systemPhoto = "photo"
        static let chevronDown = "chevron.down"
        static let chevronRight = "chevron.right"
        static let wifiSlash = "wifi.slash"
    }
    
    enum URL {
        static let contentURL = "https://mocki.io/v1/f118b9f0-6f84-435e-85d5-faf4453eb72a"
    }
}

extension String {
    static var empty: String { "" }
}
