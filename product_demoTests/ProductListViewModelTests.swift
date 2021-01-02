//
//  ProductListViewModelTests.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 1.01.2021.
//  Copyright © 2021 Kaan Biryol. All rights reserved.
//

import XCTest
@testable import product_demo

class ProductListViewModelTests: XCTestCase {

    func testCellForRowAt() {

        let actions = ProductListViewModelActions { (product) in
            print(product)
        }
        let sut = ProductListViewModel(dependencies: ProductListViewModelDependencies(),
                                       actions: actions)

        let fetchExpectation = expectation(description: #function)

        sut.fetchProductList(completion: { _ in
            fetchExpectation.fulfill()
        }, failure: { failure in
            XCTFail(failure.localizedDescription)
        })

        let rowCount: Int = sut.numberOfRowsInSection(for: 0)
        let tableView: UITableView = UITableView()
        tableView.register(ProductTableViewCell.self)
        let row = sut.cellForRowAt(tableView: tableView, for: IndexPath(row: 0, section: 0))

        waitForExpectations(timeout: 3)
        XCTAssertEqual(rowCount, 1)
        XCTAssertTrue(row is ProductTableViewCell)
        XCTAssertEqual((row as? ProductTableViewCell)?.productTitleLabel.text, ProductListRepositoryTests.mockProductListResponse.products.first?.productName)
    }

    func testRoutesToProductDetailsWithRightProduct() {
        let product = Product.stub()
        let navigationController = UINavigationController()
        let productListDependencies = ProductListCoordinatorDependencies()
        let sut = productListDependencies.makeProductListCoordinator(with: navigationController)
        sut.start()

        productListDependencies.productListViewModel?.didSelectProduct(product)

        guard let coordinator = sut as? SpyProductListCoordinator else {
            return XCTFail("")
        }

        XCTAssertEqual(coordinator.selectedProduct, product)
    }

    func testProductCellSetsRightTitle() {
        let fetchProductListExpectation = expectation(description: "")
        let product = Product.stub()
        let navigationController = UINavigationController()
        let productListDependencies = ProductListCoordinatorDependencies()
        productListDependencies.productListExpectedResult = .success(ProductListResponse(products: [product],
                                                                                         currentPage: 0, pageSize: 0, totalResults: 0, pageCount: 0))
        let coordinator = productListDependencies.makeProductListCoordinator(with: navigationController)
        coordinator.start()
        let sut = productListDependencies.productListViewModel!

        sut.fetchProductList(completion: { _ in
            fetchProductListExpectation.fulfill()
        }, failure: { _ in })

        let rowCount = sut.numberOfRowsInSection(for: 0)
        let tableView = UITableView()
        tableView.register(ProductTableViewCell.self)
        let row = sut.cellForRowAt(tableView: tableView, for: IndexPath(row: 0, section: 0))

        waitForExpectations(timeout: 1)
        XCTAssertEqual(rowCount, 1)
        XCTAssertTrue(row is ProductTableViewCell)
        XCTAssertEqual((row as? ProductTableViewCell)?.productTitleLabel.text, product.productName)
    }

//    func testShouldPaginate() {
//        let stubProduct = Product.stub()
//        let mockResult = ProductListResponse(products: [stubProduct],
//                                             currentPage: 0,
//                                             pageSize: 0,
//                                             totalResults: 0,
//                                             pageCount: 0)
//        //        mockService.productResult = mockResult
//
//        let fetchExpectation = expectation(description: #function)
//        sut.fetchProductList(completion: { (_) in
//            fetchExpectation.fulfill()
//        }) { (_) in
//
//        }
//
//        let shouldPaginate: Bool = sut.shouldPaginate(row: 0)
//        waitForExpectations(timeout: 3)
//        XCTAssertFalse(shouldPaginate)
//    }
//
//    func testPaginationReset() {
//        sut.currentPage = 10
//
//        sut.currentQuery = "new value"
//
//        XCTAssertEqual(sut.currentPage, 1)
//        XCTAssertEqual(sut.products.count, 0)
//    }
//
//    func testTableViewCell() {
//        sut.currentPage = 10
//
//        sut.currentQuery = "new value"
//
//        XCTAssertEqual(sut.currentPage, 1)
//        XCTAssertEqual(sut.products.count, 0)
//    }

}

struct ProductListViewModelDependencies: HasProductListRepository {

    var productListRepository: ProductListRepositoryProtocol {
        return ProductListRepositoryTests.mockProductListRepository
    }

}

class ProductListCoordinatorDependencies: ProductListComponent, ProductDetailsComponent, HasProductListRepository {

    var productListExpectedResult: Result<ProductListResponse, NetworkingError>?
    var productListViewModel: ProductListViewModel?

    var productListRepository: ProductListRepositoryProtocol {
        return ProductListRepository(MockNetworkRouter(result: productListExpectedResult))
    }

    func makeProductListViewModel(actions: ProductListViewModelActions) -> ProductListViewModelProtocol {
        let viewModel = ProductListViewModel(dependencies: self, actions: actions)
        productListViewModel = viewModel
        return viewModel
    }

    func makeProductListViewController(actions: ProductListViewModelActions) -> UIViewController {
        return ProductListViewController(viewModel: makeProductListViewModel(actions: actions))
    }

    func makeProductListCoordinator(with navigationController: UINavigationController) -> ProductListCoordinator {
        return SpyProductListCoordinator(navigationController: navigationController, dependencies: self)
    }

    func makeProductDetailsViewModel(payload: ProductDetailsViewModelPayload) -> ProductDetailsViewModelProtocol {
        return ProductDetailsViewModel(payload: payload)
    }

    func makeProductDetailsViewController(payload: ProductDetailsViewModelPayload) -> UIViewController {
        return makeProductDetailsViewController(payload: payload)
    }

    func makeProductDetailsCoordinator(with navigationController: UINavigationController) -> ProductDetailsCoordinator {
        return ProductDetailsCoordinator(navigationController: navigationController, dependencies: self)
    }

}

class SpyProductListCoordinator: ProductListCoordinator {

    var selectedProduct: Product?

    override func routeToProductDetails(_ product: Product) {
        selectedProduct = product
    }

}
