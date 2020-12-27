//
//  NetworkingTests.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import XCTest
@testable import product_demo

// swiftlint:disable all
class NetworkingTests: XCTestCase {
    
    func testSuccessfulResponse() {
        let expectedResult = MockResponse(field: "mock")
        let mockRouter = MockNetworkRouter(result: .success(expectedResult))
    
        mockRouter.retrieve(endpoint: MockEndpoint.fetchMock(ProductListRequest(page: 1, query: ""))) { (result: Result<MockResponse, NetworkingError>) in
            switch result {
            case .success(let response):
                XCTAssertEqual(expectedResult.field, response.field)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }
    
    func testFailure() {
        let expectedError = NetworkingError.failed
        let mockRouter = MockNetworkRouter<MockResponse>(result: .failure(expectedError))
    
        mockRouter.retrieve(endpoint: MockEndpoint.fetchMock(ProductListRequest(page: 1, query: ""))) { (result: Result<MockResponse, NetworkingError>) in
            switch result {
            case .success(let response):
                XCTFail(response.parameters.description)
            case .failure(let error):
                XCTAssertEqual(error, expectedError)
            }
        }
    }
    
}
