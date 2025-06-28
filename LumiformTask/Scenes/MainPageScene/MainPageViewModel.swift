//
//  MainPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

final class MainPageViewModel: ObservableObject {
    @Published var mainPage: ContentItem?
    @Published var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    private let router: MainPageRouter
    private let contentURL = URL(string: "https://mocki.io/v1/f118b9f0-6f84-435e-85d5-faf4453eb72a")!
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: MainPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchContent() async {
        do {
            let root = try await networkService.fetch(ContentItem.self, from: contentURL)
            await MainActor.run {
                self.mainPage = filterOutSecondPage(from: root)
            }
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }
    
    /// Removes second page from main page's items
    private func filterOutSecondPage(from root: ContentItem) -> ContentItem {
        guard root.type == .page else { return root }
        var newRoot = root
        newRoot.items = root.items?.filter { $0.title != "Second Page" }
        return newRoot
    }
    
    func navigateToSecondPage() {
        router.routeToSecondPage()
    }
}
