//
//  Encoding.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol EncoderProtocol {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
}

struct URLEncoder: EncoderProtocol {

    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkingError.failed }
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            parameters.forEach({
                let queryItem: URLQueryItem = URLQueryItem(name: $0, value: "\($1)")
                urlComponents.queryItems?.append(queryItem)
            })
            urlRequest.url = urlComponents.url
        }
    }

}
