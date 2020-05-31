//
//  MockNetworking.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
@testable import product_demo

struct MockRequest: Codable {}

struct MockResponse: Codable {
      let field: String
  }

class MockRouter: RouterProtocol {

    var task: URLSessionTask?
    var session: URLSession = URLSession.shared
    var urlBuilder: URLBuilderProtocol = URLBuilder()

    var completionResult: Result<MockResponse, NetworkingError>

    init(completionResult: Result<MockResponse, NetworkingError>) {
        self.completionResult = completionResult
    }

    // swiftlint:disable all
    func request<T>(request: APIProtocol, completion: @escaping NetworkCompletion<T>) {
        completion(completionResult as! Result<T, NetworkingError>)
    }
}

class MockNetworkManager: NetworkManagerProtocol {
    var router: RouterProtocol = MockRouter(completionResult: .success(MockResponse(field: "mock")))
    
    init(router: RouterProtocol) {
        self.router = router
    }
}

class MockAPI: APIProtocol {
    var path: String = "/"
    var httpMethod: HTTPMethod = .get
    var httpTask: HTTPTask
    
    init(httpTask: HTTPTask) {
        self.httpTask = httpTask
    }
}

class MockService: ServiceProtocol {
    
    var networkManager: NetworkManagerProtocol {
        return MockNetworkManager(router: MockRouter(completionResult: .failure(.failed)))
    }
    
}

class ProductListMockService: ProductListServiceProtocol {
    
    var networkManager: NetworkManagerProtocol {
        return MockNetworkManager(router: MockRouter(completionResult: .failure(.failed)))
    }
    
    var productResult: ProductListResponse?
    
    func fetchProductList(request: ProductListAPI, success: @escaping (ProductListResponse?) -> Void, failure: @escaping (NetworkingError) -> Void) {
        success(productResult)
    }
}
