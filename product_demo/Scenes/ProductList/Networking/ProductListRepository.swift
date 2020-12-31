//
//  ProductListRepository.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol ProductListRepositoryProtocol {
    func fetchProductList(request: ProductListRequest,
                          success: @escaping (ProductListResponse?) -> Void,
                          failure: @escaping (NetworkingError) -> Void)
}

protocol UserInfoRepositoryProtocol {
    func fetchUserInfo(completion: () -> Void)
}

struct UserInfoRepository: UserInfoRepositoryProtocol {

    func fetchUserInfo(completion: () -> Void) {
        completion()
    }

}

struct ProductListRepository: ProductListRepositoryProtocol {

    let networkRouter: NetworkRouterProtocol

    init(_ networkRouter: NetworkRouterProtocol) {
        self.networkRouter = networkRouter
    }

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
