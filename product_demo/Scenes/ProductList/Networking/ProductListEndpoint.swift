//
//  ProductListEndpoint.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

enum ProductListEndpoint: EndpointProtocol {

    case products(_ request: ProductListRequest)

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

//    static func makeProductListEndpoint(_ request: ProductListRequest) -> Endpoint {
//        return Endpoint(path: "/search",
//                        method: .get,
//                        task: .requestParameters(request: request,
//                                                 encoder: .url))
//    }
}
