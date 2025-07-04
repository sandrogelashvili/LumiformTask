//
//  SecondPageViewModeling.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 04.07.25.
//

import Foundation

protocol SecondPageViewModeling {
    var state: SecondPageUIState { get set }

    func fetchContent()
}
