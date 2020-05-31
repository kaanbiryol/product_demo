//
//  ProductListService.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol ProductListServiceProtocol: ServiceProtocol {
    func fetchProductList(request: ProductListAPI, success: @escaping (ProductListResponse?) -> Void,
                          failure: @escaping (NetworkingError) -> Void)
}

struct ProductListService: ProductListServiceProtocol {

    func fetchProductList(request: ProductListAPI, success: @escaping (ProductListResponse?) -> Void, failure: @escaping (NetworkingError) -> Void) {
        networkManager.retrieve(request: request, success: success, failure: failure)
    }

}

enum ProductListAPI: APIProtocol {

    case products(request: ProductListRequest)

    var path: String {
        switch self {
        case .products:
            return "/search"
        }
    }
    var httpMethod: HTTPMethod {
        switch self {
        case .products:
            return .get
        }
    }

    var httpTask: HTTPTask {
        switch self {
        case .products(let request):
            return .requestParameters(request: request, encoder: .url)
        }
    }
}
