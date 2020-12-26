//
//  URLBuilder.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol URLBuilderProtocol {
    func buildRequest(with api: EndpointProtocol) throws -> URLRequest
}

class URLBuilder: URLBuilderProtocol {}

extension URLBuilderProtocol {
    func buildRequest(with api: EndpointProtocol) throws -> URLRequest {
        var urlRequest: URLRequest = URLRequest(url: api.baseURL.appendingPathComponent(api.path))
        urlRequest.httpMethod = api.httpMethod.rawValue
        switch api.httpTask {
        case .requestParameters(let request, let encoder):
            do {
                try encoder.encode(urlRequest: &urlRequest, with: request.parameters)
            } catch {
                throw NetworkingError.failed
            }
        }
        return urlRequest
    }
}
