//
//  ProductListViewModel.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListViewModelProtocol {
    var service: ProductListServiceProtocol { get }
    var products: [Product] { get }
    var currentPage: Int { get set }
    var currentQuery: String { get set }
    func fetchProductList(completion: @escaping (ProductListResponse?) -> Void, failure: @escaping (NetworkingError) -> Void)
    func cellForRowAt(tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
    func numberOfRowsInSection(for section: Int) -> Int
    func shouldPaginate(row: Int) -> Bool
}

class ProductListViewModel: ProductListViewModelProtocol {

    var service: ProductListServiceProtocol
    private(set) var productsResponse: ProductListResponse? {
        didSet {
            currentPage = productsResponse?.currentPage ?? 0
            products.append(contentsOf: productsResponse?.products ?? [])
        }
    }
    var products: [Product] = []
    var currentPage: Int = 1
    var currentQuery: String = "" {
        didSet {
            resetPagination()
        }
    }

    private var productListRequest: ProductListRequest {
        return ProductListRequest(page: currentPage, query: currentQuery)
    }

    init(service: ProductListServiceProtocol) {
        self.service = service
    }

    func fetchProductList(completion: @escaping (ProductListResponse?) -> Void, failure: @escaping (NetworkingError) -> Void) {
        let productListAPI: ProductListAPI = ProductListAPI.products(request: productListRequest)
        service.fetchProductList(request: productListAPI, success: { [weak self] (response: ProductListResponse?) in
            self?.productsResponse = response
            completion(response)
        }, failure: { (error) in
            failure(error)
        })
    }

    func cellForRowAt(tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
        guard products.count > 0 else { return UITableViewCell() }
        let cell: ProductTableViewCell = tableView.dequeue(cell: ProductTableViewCell.self)
        let productCellViewModel: ProductTableViewCellProtocol = ProductTableViewCellViewModel(product: products[indexPath.row])
        cell.populate(with: productCellViewModel)
        return cell
    }

    func numberOfRowsInSection(for section: Int) -> Int {
        return products.count
    }

    func shouldPaginate(row: Int) -> Bool {
        return row + 2 == products.count && productsResponse?.canPaginate ?? false
    }

    private func resetPagination() {
        currentPage = 1
        products = []
    }

}

