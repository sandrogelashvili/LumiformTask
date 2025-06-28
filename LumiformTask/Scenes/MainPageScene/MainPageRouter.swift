//
//  MainPageRouter.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

class MainPageRouter {
    
    private let rootCoordinator: NavigationCoordinator
    
    init(rootCoordinator: NavigationCoordinator) {
        self.rootCoordinator = rootCoordinator
    }
    
    func routeToSecondPage() {
//        let router = SecondPageRouter(rootCoordinator: self.rootCoordinator)
//        rootCoordinator.push(router)
    }
}

extension MainPageRouter: Routable {
    
    func makeView() -> AnyView {
        let viewModel = MainPageViewModel(router: self)
        let view = MainPageView(viewModel: viewModel)
        return AnyView(view)
    }
}

extension MainPageRouter {
    static func == (lhs: MainPageRouter, rhs: MainPageRouter) -> Bool {
        return ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
