//
//  ProductListRepositoryTests.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import XCTest
@testable import product_demo

extension Product {
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

extension Product: Equatable {
    public static func == (lhs: Product, rhs: Product) -> Bool {
        return lhs.productID == rhs.productID
    }
}

class ProductListRepositoryTests: XCTestCase {

    static var mockProductListResponse: ProductListResponse {
        return ProductListResponse(products: [Product.stub()],
                                   currentPage: 0,
                                   pageSize: 0,
                                   totalResults: 0,
                                   pageCount: 0)
    }

    static var mockProductListRepository: ProductListRepository {
        let router = MockNetworkRouter(result: .success(mockProductListResponse))
        let sut = ProductListRepository(router)
        return sut
    }

    override func setUp() {
        super.setUp()
    }

    func testProductListRepositoryFetchSuccess() {
        let fetchExpectation = expectation(description: #function)
        var productListResponse: ProductListResponse?
        let sut = ProductListRepositoryTests.mockProductListRepository

        sut.fetchProductList(request: ProductListRequest(page: 0, query: "apple"), success: { response in
            productListResponse = response
            fetchExpectation.fulfill()
        }, failure: { failure in
            XCTFail(failure.localizedDescription)
        })

        waitForExpectations(timeout: 1)
        XCTAssertEqual(ProductListRepositoryTests.mockProductListResponse.products.first?.productID,
                       productListResponse?.products.first?.productID)
    }

}
