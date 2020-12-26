//
//  ProductListRepository.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol ProductListRepositoryProtocol: HasNetworkRouter {
    func fetchProductList(request: ProductListRequest,
                          success: @escaping (ProductListResponse?) -> Void,
                          failure: @escaping (NetworkingError) -> Void)
}

struct ProductListRepository: ProductListRepositoryProtocol {
    func fetchProductList(request: ProductListRequest,
                          success: @escaping (ProductListResponse?) -> Void,
                          failure: @escaping (NetworkingError) -> Void) {
        networkRouter.retrieve(endpoint: ProductListEndpoint.products(request),
                               completion: { (result: Result<ProductListResponse?, NetworkingError>) in
                                switch result {
                                case .success(let response):
                                    success(response)
                                case .failure(let error):
                                    failure(error)
                                }
                               })
    }
}
