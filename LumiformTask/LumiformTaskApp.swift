//
//  LumiformTaskApp.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI

@main
struct LumiformTaskApp: App {
    @ObservedObject var viewModel = MainPageViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainPageView(viewModel: viewModel)
        }
    }
}
