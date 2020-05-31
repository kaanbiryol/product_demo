//
//  NetworkManager.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol NetworkManagerProtocol {
    var router: RouterProtocol { get set }
    func retrieve<T: Codable>(request: APIProtocol, success: @escaping (T?) -> Void, failure: @escaping (NetworkingError) -> Void)
}

extension NetworkManagerProtocol {
    func retrieve<T: Codable>(request: APIProtocol, success: @escaping (T?) -> Void, failure: @escaping  (NetworkingError) -> Void) {
        router.request(request: request) { (result: Result<T, NetworkingError>) in
            switch result {
            case .success(let responseModel):
                success(responseModel)
            case .failure(let error):
                failure(error)
            }
        }
    }
}

class NetworkManager: NetworkManagerProtocol {
    var router: RouterProtocol = Router()
}

protocol ServiceProtocol {
    var networkManager: NetworkManagerProtocol { get }
}

extension ServiceProtocol {
    //FIXME:
    var networkManager: NetworkManagerProtocol {
        return NetworkManager()
    }
}
