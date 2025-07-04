//
//  MainPageViewModeling.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 04.07.25.
//

import Foundation

protocol MainPageViewModeling {
    var state: MainPageUIState { get set }

    func fetchContent()
    @MainActor func navigateToSecondPage()
}
