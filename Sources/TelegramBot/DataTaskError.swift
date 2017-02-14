//
// DataTaskError.swift
//
// This source file is part of the Telegram Bot SDK for Swift (unofficial).
//
// Copyright (c) 2015 - 2016 Andrey Fidrya and the project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See LICENSE.txt for license information
// See AUTHORS.txt for the list of the project authors
//

import Foundation
import SwiftyJSON

/// Telegram DataTask errors
public enum DataTaskError {
    /// Invalid request
    case invalidRequest
    
    /// Libcurl initialization error
    case libcurlInitError
    
    /// Libcurl error
    case libcurlError(code: UInt32, description: String)
    
    /// Aborted by callback
    case libcurlAbortedByCallback
    
    /// Status Code is not 200 (OK)
    case invalidStatusCode(statusCode: Int, data: Data?)
    
    /// Telegram server returned no data
    case noDataReceived
    
    /// Server error (server returned "ok: false")
    case serverError(telegramResponse: Response,
        data: Data)
}

extension DataTaskError: CustomDebugStringConvertible {
    // MARK: CustomDebugStringConvertible
    public var debugDescription: String {
        switch self {
        case .invalidRequest:
            return "Invalid HTTP request"
        case .libcurlInitError:
            return "Libcurl initialization error"
        case let .libcurlError(code, description):
            return "Libcurl error \(code): \(description)"
        case .libcurlAbortedByCallback:
            return "Libcurl aborted by callback"
        case .invalidStatusCode(let statusCode, _):
            return "Expected status code 200, got \(statusCode)"
        case .noDataReceived:
            return "No data received"
        case .serverError(_, _):
            return "Telegram server returned an error"
        }
    }
}
