//
//  Endpoint.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol EndpointProtocol {
    var baseURL: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var httpTask: HTTPTask { get }
}

//class Endpoint: EndpointProtocol {
//
//    let path: String
//    let httpMethod: HTTPMethod
//    let httpTask: HTTPTask
//
//    init(path: String,
//         method: HTTPMethod,
//         task: HTTPTask) {
//        self.path = path
//        self.httpMethod = method
//        self.httpTask = task
//    }
//
//}

extension EndpointProtocol {
    var baseURL: URL {
        return URL(string: "https://bdk0sta2n0.execute-api.eu-west-1.amazonaws.com/mobile-assignment/")!
    }
}
