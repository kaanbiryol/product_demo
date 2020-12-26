//
//  ProductListService.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol HasProductListRepository {
    var prouctListService: ProductListRepositoryProtocol { get }
}

extension HasProductListRepository {
    var prouctListService: ProductListRepositoryProtocol {
        return ProductListRepository()
    }
}
