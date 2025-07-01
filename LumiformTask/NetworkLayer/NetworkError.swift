//
//  NetworkError.swift
//  LumiformTask
//
//  Created by Aleksandre Gelashvili on 28.06.25.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingFailed(Error)
    case unauthorized
    case forbidden
    case notFound
    case timeout
    case serverError
    case httpError(Int)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .requestFailed(let error):
            return "Network request failed: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid server response."
        case .decodingFailed(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        case .unauthorized:
            return "Unauthorized (401)."
        case .forbidden:
            return "Forbidden (403)."
        case .notFound:
            return "Not found (404)."
        case .timeout:
            return "Request timeout (408)."
        case .serverError:
            return "Server error (5xx)."
        case .httpError(let code):
            return "Unhandled HTTP error: \(code)."
        }
    }
}
