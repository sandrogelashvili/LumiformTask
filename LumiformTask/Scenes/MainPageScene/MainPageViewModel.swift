//
//  MainPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

final class MainPageViewModel: MainPageViewModeling {
    var state: MainPageUIState = MainPageUIState()
    
    private let networkService: NetworkServiceProtocol
    private let router: MainPageRouter
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: MainPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchContent() {
        guard let url = URL(string: UIStrings.URL.contentURL) else {
            state.errorMessage = UIStrings.Alert.invalidURL
            state.isShowingError = true
            return
        }
        
        Task {
            await MainActor.run {
                state.isLoading = true
            }
            do {
                let root = try await networkService.fetch(ContentModel.self, from: url)
                let filtered = filterOutNestedPages(from: root)
                await MainActor.run {
                    state.mainPageContent = filtered
                    state.initialLoadCompleted = true
                    state.isLoading = false
                }
            } catch {
                await MainActor.run {
                    state.errorMessage = error.localizedDescription
                    state.isShowingError = true
                    state.initialLoadCompleted = true
                    state.isLoading = false
                }
            }
        }
    }
    
    private func filterOutNestedPages(from root: ContentModel) -> ContentModel {
        guard root.type == .page else { return root }
        var newRoot = root
        newRoot.items = root.items?.filter { $0.type != .page }
        return newRoot
    }
    
    @MainActor func navigateToSecondPage() {
        router.routeToSecondPage()
    }
}
