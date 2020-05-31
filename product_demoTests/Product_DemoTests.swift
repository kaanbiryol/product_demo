//
//  product_demoTests.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import XCTest
@testable import product_demo

// swiftlint:disable all

private extension Product {
    static func stub() -> Product {
        return Product(productID: 1,
                       productName: "ProductName",
                       usPS: [],
                       availabilityState: 0,
                       salesPriceIncVat: 0,
                       productImage: "",
                       coolbluesChoiceInformationTitle: "",
                       nextDayDelivery: true,
                       listPriceIncVat: 0,
                       listPriceExVat: nil)
    }
}

class product_demoTests: XCTestCase {

    var sut: ProductListViewModel!
    var mockService: ProductListMockService!
    
    override func setUp() {
        super.setUp()
        mockService = ProductListMockService()
        sut = ProductListViewModel(service: mockService)
    }
    
    func testProductListFetchSuccess() {
        var productListResponse: ProductListResponse?
        let stubProduct = Product.stub()
        let mockResult = ProductListResponse(products: [stubProduct],
                                             currentPage: 0,
                                             pageSize: 0,
                                             totalResults: 0,
                                             pageCount: 0)
        mockService.productResult = mockResult
        
        let fetchExpectation = expectation(description: #function)
        sut.fetchProductList(completion: { (response) in
            productListResponse = response
            fetchExpectation.fulfill()
        }) { (error) in
            
        }
        
        waitForExpectations(timeout: 3)
        XCTAssertEqual(stubProduct.productID, productListResponse?.products.first?.productID)
    }
    
    func testCellForRowAt() {
        let stubProduct = Product.stub()
        let mockResult = ProductListResponse(products: [stubProduct],
                                             currentPage: 0,
                                             pageSize: 0,
                                             totalResults: 0,
                                             pageCount: 0)
        mockService.productResult = mockResult
        
        let fetchExpectation = expectation(description: #function)
        sut.fetchProductList(completion: { (response) in
            fetchExpectation.fulfill()
        }) { (error) in
            
        }
        
        let rowCount: Int = sut.numberOfRowsInSection(for: 0)
        let tableView: UITableView = UITableView()
        tableView.register(ProductTableViewCell.self)
        let row = sut.cellForRowAt(tableView: tableView, for: IndexPath(row: 0, section: 0))
        
        
        waitForExpectations(timeout: 3)
        XCTAssertEqual(rowCount, 1)
        XCTAssertTrue(row is ProductTableViewCell)
        XCTAssertEqual((row as? ProductTableViewCell)?.productTitleLabel.text, stubProduct.productName)
    }
    
    
    func testShouldPaginate() {
        let stubProduct = Product.stub()
        let mockResult = ProductListResponse(products: [stubProduct],
                                             currentPage: 0,
                                             pageSize: 0,
                                             totalResults: 0,
                                             pageCount: 0)
        mockService.productResult = mockResult
        
        let fetchExpectation = expectation(description: #function)
        sut.fetchProductList(completion: { (response) in
            fetchExpectation.fulfill()
        }) { (error) in
            
        }
        
        let shouldPaginate: Bool = sut.shouldPaginate(row: 0)
        waitForExpectations(timeout: 3)
        XCTAssertFalse(shouldPaginate)
    }
    
    func testPaginationReset() {
        sut.currentPage = 10
        
        sut.currentQuery = "new value"
        
        XCTAssertEqual(sut.currentPage, 1)
        XCTAssertEqual(sut.products.count, 0)
    }

    func testTableViewCell() {
        sut.currentPage = 10
        
        sut.currentQuery = "new value"
        
        XCTAssertEqual(sut.currentPage, 1)
        XCTAssertEqual(sut.products.count, 0)
    }
}


