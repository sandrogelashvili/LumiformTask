//
//  ViewFactory.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

protocol ViewFactory {
    func makeView() -> AnyView
}
