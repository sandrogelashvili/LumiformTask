//
//  SecondPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 01.07.25.
//

import Foundation

final class SecondPageViewModel: ObservableObject {
    @Published var secondPageContent: ContentItem?
    @Published var errorMessage: String?
    
    private let networkService: NetworkServiceProtocol
    private let router: SecondPageRouter
    private let contentURL = URL(string: "https://mocki.io/v1/f118b9f0-6f84-435e-85d5-faf4453eb72a")!
    
    init(networkService: NetworkServiceProtocol = NetworkService(), router: SecondPageRouter) {
        self.networkService = networkService
        self.router = router
    }
    
    func fetchSecondPage() async {
        do {
            let fullContent = try await networkService.fetch(ContentItem.self, from: contentURL)
            let nestedPage = findFirstNestedPage(excluding: fullContent)
            await MainActor.run {
                self.secondPageContent = nestedPage
            }
        } catch {
            self.errorMessage = error.localizedDescription
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
