//
//  BaseViewModel.swift
//  Newsyyy
//
//  Created by Pramodya Abeysinghe on 2021-01-23.
//

import Foundation

class BaseViewModel {
    /// Handle possible errors and return a message string value
    /// - Parameter error: an error of Error type
    /// - Returns: a message of String type
    func handleAPIError(for error: Error) -> String {
        if let error = error as? APIError {
            switch error {
            case .badRequest(let message, _):
                return message
            }
        } else if let errorResponse = error as? DecodingError {
            return errorResponse.localizedDescription
        } else {
            return error.localizedDescription
        }
    }
}
