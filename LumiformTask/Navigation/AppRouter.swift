//
//  AppRouter.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

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

// MARK: NavigationCoordinator implementation

extension AppRouter: NavigationCoordinator {
    func push(_ router: any Routable) {
        DispatchQueue.main.async {
            let wrappedRouter = AnyRoutable(router)
            self.paths.append(wrappedRouter)
        }
    }
    
    func popLast() {
        DispatchQueue.main.async {
            self.paths.removeLast()
        }
    }
    
    func popToRoot() {
        DispatchQueue.main.async {
            self.paths.removeLast(self.paths.count)
        }
    }
}
