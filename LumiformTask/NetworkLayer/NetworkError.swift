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
            return "The requested address is incorrect"
        case .requestFailed:
            return "There was a problem connecting to the server"
        case .invalidResponse:
            return "The server returned an invalid response"
        case .decodingFailed:
            return "We couldn't read the data properly"
        case .unauthorized:
            return "You're not authorized to access this content"
        case .forbidden:
            return "You don't have permission to view this content"
        case .notFound:
            return "The requested content was not found"
        case .timeout:
            return "The request took too long. Please try again"
        case .serverError:
            return "Something went wrong on our end. Please try again later"
        case .httpError(let code):
            return "Unexpected server response (code: \(code))"
        }
    }
}
