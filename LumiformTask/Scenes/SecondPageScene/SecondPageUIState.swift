//
//  SecondPageUIState.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 04.07.25.
//

import Observation

@Observable
final class SecondPageUIState {
    var secondPageContent: ContentModel?
    var errorMessage: String?
    var isShowingError: Bool = false
    var isLoading: Bool = false
}
