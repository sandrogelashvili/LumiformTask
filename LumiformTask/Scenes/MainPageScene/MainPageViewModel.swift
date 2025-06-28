//
//  MainPageViewModel.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

@MainActor
final class MainPageViewModel: ObservableObject {
    @Published var rootContent: ContentItem?
    @Published var errorMessage: String?

    private let networkService: NetworkServiceProtocol
    private let contentURL = URL(string: "https://mocki.io/v1/f118b9f0-6f84-435e-85d5-faf4453eb72a")!

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchContent() async {
        do {
            let content = try await networkService.fetch(ContentItem.self, from: contentURL)
            self.rootContent = content
        } catch {
            if let netErr = error as? NetworkError {
                self.errorMessage = netErr.localizedDescription
            } else {
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
