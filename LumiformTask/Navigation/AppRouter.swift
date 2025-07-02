//
//  AppRouter.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

@MainActor
class AppRouter: ObservableObject {
    @Published var paths: NavigationPath
    
    init(paths: NavigationPath = NavigationPath()) {
        self.paths = paths
    }
    
    func resolveInitialRouter() -> any Routable {
        let mainPageRouter = MainPageRouter(rootCoordinator: self)
        return mainPageRouter
    }
}

extension AppRouter: NavigationCoordinator {
    func push(_ router: any Routable) {
        let wrappedRouter = AnyRoutable(router)
        self.paths.append(wrappedRouter)
    }

    func popLast() {
        self.paths.removeLast()
    }

    func popToRoot() {
        self.paths.removeLast(self.paths.count)
    }
}
