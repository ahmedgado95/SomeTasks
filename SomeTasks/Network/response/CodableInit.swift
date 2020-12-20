//
//  CodableInit.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import Foundation
protocol CodableInit {
    init(data: Data) throws
}

extension CodableInit where Self: Codable {
    init(data: Data) throws {
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        self = try decoder.decode(Self.self, from: data)
    }
}

