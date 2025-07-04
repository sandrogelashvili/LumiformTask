//
//  SecondPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import Foundation

final class SecondPageViewModel: SecondPageViewModeling {
    var state: SecondPageUIState = SecondPageUIState()
    
    private let networkService: NetworkServiceProtocol
    private let router: SecondPageRouter
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: SecondPageRouter) {
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
                let fullContent = try await networkService.fetch(ContentModel.self, from: url)
                let nestedPage = findFirstNestedPage(excluding: fullContent)
                await MainActor.run {
                    state.secondPageContent = nestedPage
                    state.isLoading = false
                }
            } catch {
                await MainActor.run {
                    state.errorMessage = error.localizedDescription
                    state.isShowingError = true
                    state.isLoading = false
                }
            }
        }
    }
    
    private func findFirstNestedPage(excluding root: ContentModel) -> ContentModel? {
        guard let children = root.items else { return nil }
        
        for child in children {
            if child.type == .page {
                return child
            }
            if let result = findFirstNestedPage(excluding: child) {
                return result
            }
        }
        
        return nil
    }
}
