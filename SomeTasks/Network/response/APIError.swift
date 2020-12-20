//
//  APIError.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import Foundation

/// Errors enum, to be sent back to network caller, so he handle it gracefully.
enum APIError:  LocalizedError {
    case errorMessage(message : String)
    var localizedDescription: String  {
        switch self {
        case .errorMessage(let message):
            return message
        }
    }
}
