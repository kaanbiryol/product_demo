//
//  ProductListResponse.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

struct ProductListResponse: Codable {
    let products: [Product]
    let currentPage, pageSize, totalResults, pageCount: Int

    var canPaginate: Bool {
        return currentPage < pageCount
    }
}

struct Product: Codable {
    let productID: Int
    let productName: String
    let usPS: [String]
    let availabilityState: Int
    let salesPriceIncVat: Double
    let productImage: String
    let coolbluesChoiceInformationTitle: String?
    let nextDayDelivery: Bool
    let listPriceIncVat: Int?
    let listPriceExVat: Double?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case productName
        case usPS = "USPs"
        case availabilityState, salesPriceIncVat, productImage, coolbluesChoiceInformationTitle, nextDayDelivery, listPriceIncVat, listPriceExVat
    }
}
