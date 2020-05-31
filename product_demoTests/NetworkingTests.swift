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
        let networkExpectation = expectation(description: #function)
        let result = MockResponse(field: "mock")
        let mockRouter = MockRouter(completionResult: .success(result))
        let mockNetworkManager = MockNetworkManager(router: mockRouter)
        let httpTask: HTTPTask = .requestParameters(request: MockRequest(), encoder: .url)
        var responseFromRequest: MockResponse?
        
        mockNetworkManager.retrieve(request: MockAPI(httpTask: httpTask), success: { (response: MockResponse?) in
            responseFromRequest = response
            networkExpectation.fulfill()
        }) { (failure) in
            print("")
        }
        
        waitForExpectations(timeout: 3)
        XCTAssertEqual(result.field, responseFromRequest?.field)
    }
    
    func testFailure() {
        let networkExpectation = expectation(description: #function)
        let mockRouter = MockRouter(completionResult: .failure(.failed))
        let mockNetworkManager = MockNetworkManager(router: mockRouter)
        let httpTask: HTTPTask = .requestParameters(request: MockRequest(), encoder: .url)
        
        NetworkManager().retrieve(request: MockAPI(httpTask: httpTask), success: { (response: MockResponse?) in
        }) { (failure) in
            networkExpectation.fulfill()
            XCTAssertEqual(failure, .failed)
        }
        
        waitForExpectations(timeout: 3)
        
    }
    
}
