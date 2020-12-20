//
//  ApiKeyModel.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import Foundation

struct ApiKeyModel: Codable  , CodableInit {
    let success: Bool
    let query: Query
    let info: Info
    let date: String
    let result: Double
}

// MARK: - Info
struct Info: Codable {
    let timestamp: Int
    let rate: Double
}

// MARK: - Query
struct Query: Codable {
    let from, to: String
    let amount: Int
}
