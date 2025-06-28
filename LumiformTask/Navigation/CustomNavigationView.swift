//
//  CustomNavigationView.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

struct CustomNavigationView: View {
    
    @StateObject var appRouter: AppRouter
    
    var body: some View {
        NavigationStack(path: $appRouter.paths) {
            appRouter.resolveInitialRouter().makeView()
                .navigationDestination(for: AnyRoutable.self) { router in
                    router.makeView()
                }
        }
    }
}
