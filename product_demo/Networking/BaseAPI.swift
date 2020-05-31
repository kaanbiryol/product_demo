//
//  BaseAPI.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol APIProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
}

extension APIProtocol {
//    https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/search?quer y=apple&page=1
    var baseURL: URL {
        return URL(string: "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/")!
    }

}
