//
//  NetworkingMocks.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
@testable import product_demo

class MockNetworkRouter<T: Codable>: NetworkRouterProtocol {

    var task: URLSessionTask?
    var session: URLSession = URLSession.shared
    var urlBuilder: URLBuilderProtocol = URLBuilder()

    var result: Result<T, NetworkingError>?

    init(result: Result<T, NetworkingError>?) {
        self.result = result
    }

    // swiftlint:disable all
    func retrieve<T>(endpoint: EndpointProtocol, completion: @escaping NetworkCompletion<T>) where T : Decodable, T : Encodable {
        completion(result as! Result<T, NetworkingError>)
    }

}

struct MockRequest: Codable {}

struct MockResponse: Codable {
    let field: String
}

enum MockEndpoint: EndpointProtocol {
    
    case fetchMock(_ request: ProductListRequest)
    
    var path: String {
        switch self {
        case .fetchMock:
            return "/mock"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .fetchMock:
            return .get
        }
    }
    
    var httpTask: HTTPTask {
        switch self {
        case .fetchMock(let request):
            return .requestParameters(request: request, encoder: .url)
        }
    }
    
}
