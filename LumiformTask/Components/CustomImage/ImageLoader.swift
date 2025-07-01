//
//  ImageLoader.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import SwiftUI
import Combine

final class RemoteImageLoader: ObservableObject {
    @Published var state: RemoteImageState = .loading
    
    private let url: URL
    private var cancellable: AnyCancellable?
    
    init(url: URL) {
        self.url = url
        load()
    }
    
    func load() {
        let request = URLRequest(url: url)
        
        cancellable = URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result in
                guard let image = UIImage(data: result.data) else {
                    throw NetworkError.decodingFailed(URLError(.cannotDecodeContentData))
                }
                return image
            }
            .map { RemoteImageState.success(Image(uiImage: $0)) }
            .catch { error -> Just<RemoteImageState> in
                let wrappedError = (error as? NetworkError) ?? NetworkError.requestFailed(error)
                return Just(.failure(wrappedError))
            }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.state = $0 }
    }
}
