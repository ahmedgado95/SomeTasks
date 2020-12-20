//
//  ApiRouter.swift
//  SomeTasks
//
//  Created by ahmed gado on 20/12/2020.
//  Copyright © 2020 ahmedgado. All rights reserved.
//

import Foundation
import Alamofire
enum ApiRouter: URLRequestBuilder {
    case checkKey(keyUrl: String , from: String , to: String , amount: String)

    // MARK: - Path
    internal var path: String {
        switch self {
        case .checkKey(keyUrl: let keyUrl, from: let from, to: let to, amount: let amount):
            return ApiUrl.key + keyUrl + "&from=" + from + "&to=" + to + "&amount=" + amount
        }
    }
    // MARK: - Parameters
    internal var parameters: Parameters? {
        let params = Parameters.init()
        switch self {
        case .checkKey:
            return nil
        }
        return params
    }

    // MARK: - Methods
    internal var method: HTTPMethod {
        switch self {
        case .checkKey :
        return .get
        }
    }
}


