//
//  ImageState.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

enum RemoteImageState {
    case loading
    case success(Image)
    case failure(NetworkError)
}
