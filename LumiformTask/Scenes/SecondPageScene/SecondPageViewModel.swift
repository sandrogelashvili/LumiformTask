//
//  SecondPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import Foundation

final class SecondPageViewModel: ObservableObject {
    @Published var secondPageContent: ContentItem?
    @Published var errorMessage: String? {
        didSet { isShowingError = errorMessage != nil }
    }
    @Published var isShowingError: Bool = false
    @Published var isLoading: Bool = false
    
    private let networkService: NetworkServiceProtocol
    private let router: SecondPageRouter
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: SecondPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchSecondPage() {
        guard let url = URL(string: UIStrings.URL.contentURL) else {
            errorMessage = UIStrings.Alert.invalidURL
            return
        }
        
        Task {
            await MainActor.run { self.isLoading = true }
            do {
                let fullContent = try await networkService.fetch(ContentItem.self, from: url)
                let nestedPage = findFirstNestedPage(excluding: fullContent)
                await MainActor.run {
                    self.secondPageContent = nestedPage
                    self.isLoading = false
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    private func findFirstNestedPage(excluding root: ContentItem) -> ContentItem? {
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
