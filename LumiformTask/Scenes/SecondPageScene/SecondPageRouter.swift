//
//  SecondPageRouter.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import SwiftUI

class SecondPageRouter {
    
    private let rootCoordinator: NavigationCoordinator
    
    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }
}

extension SecondPageRouter: Routable {
    
    func makeView() -> AnyView {
        let viewModel = SecondPageViewModel(router: self)
        let view = SecondPageView(viewModel: viewModel)
        return AnyView(view)
    }
}

extension SecondPageRouter {
    static func == (lhs: SecondPageRouter, rhs: SecondPageRouter) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}

