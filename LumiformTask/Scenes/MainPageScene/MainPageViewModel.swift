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
    private let contentURL = URL(string: "https://mocki.io/v1/f118b9f0-6f84-435e-85d5-faf4453eb72a")!
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: MainPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchContent() {
        Task {
            await MainActor.run {
                self.isLoading = true
            }
            do {
                let root = try await networkService.fetch(ContentItem.self, from: contentURL)
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
