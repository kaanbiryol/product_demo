//
//  ProductListRequest.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

struct ProductListRequest: Codable {
    let page: Int
    let query: String
}
