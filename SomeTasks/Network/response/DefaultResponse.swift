//
//  DefaultResponse.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import Foundation
import Foundation
/// Default response to check for every request since this's how this api works.
struct DefaultResponse: Codable, CodableInit , LocalizedError {
    var success : Bool
    var error : errorData?
    
}
struct errorData: Codable {
    let code: Int
    let info: String
}
