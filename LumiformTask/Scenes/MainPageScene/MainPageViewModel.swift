//
//  MainPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

final class MainPageViewModel: ObservableObject {
    @Published var mainPageContent: ContentItem?
    @Published var errorMessage: String? {
        didSet { isShowingError = errorMessage != nil }
    }
    @Published var isShowingError: Bool = false
    @Published var isLoading: Bool = false
    @Published var initialLoadCompleted: Bool = false
    
    private let networkService: NetworkServiceProtocol
    private let router: MainPageRouter
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: MainPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchContent() {
        guard let url = URL(string: UIStrings.URL.contentURL) else {
                errorMessage = "Invalid URL"
                return
            }
        
        Task {
            await MainActor.run {
                self.isLoading = true
            }
            do {
                let root = try await networkService.fetch(ContentItem.self, from: url)
                await MainActor.run {
                    self.mainPageContent = filterOutNestedPages(from: root)
                    self.isLoading = false
                    self.initialLoadCompleted = true
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.isLoading = false
                    self.initialLoadCompleted = true
                }
            }
        }
    }
    
    private func filterOutNestedPages(from root: ContentItem) -> ContentItem {
        guard root.type == .page else { return root }
        var newRoot = root
        newRoot.items = root.items?.filter { $0.type != .page }
        return newRoot
    }
    
    @MainActor func navigateToSecondPage() {
        router.routeToSecondPage()
    }
}
