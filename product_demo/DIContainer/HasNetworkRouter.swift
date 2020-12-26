//
//  HasNetworkRouter.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol HasNetworkRouter {
    var networkRouter: NetworkRouterProtocol { get }
}

extension HasNetworkRouter {
    var networkRouter: NetworkRouterProtocol {
        return NetworkRouter()
    }
}
