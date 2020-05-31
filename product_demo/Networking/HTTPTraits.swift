//
//  HTTPTraits.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

enum HTTPTask {
    case requestParameters(request: Encodable, encoder: ParameterEncoding)
}

enum HTTPMethod: String {
    case get = "GET"
}

enum NetworkingError: Error {
    case failed
}

enum ParameterEncoding: EncoderProtocol {

    case url

    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        switch self {
        case .url:
            try URLEncoder().encode(urlRequest: &urlRequest, with: parameters)
        }
    }

}
