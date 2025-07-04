//
//  MainPageUIState.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 03.07.25.
//

import Observation

@Observable
final class MainPageUIState {
    var mainPageContent: ContentModel?
    var errorMessage: String?
    var isShowingError: Bool = false
    var isLoading: Bool = false
    var initialLoadCompleted: Bool = false
}
