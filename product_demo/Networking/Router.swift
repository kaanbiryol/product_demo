//
//  Router.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

typealias Parameters = [String: Any]
typealias NetworkCompletion<T> = (Result<T, NetworkingError>) -> Void

protocol RouterProtocol {
    var task: URLSessionTask? { get }
    var session: URLSession { get }
    var urlBuilder: URLBuilderProtocol { get }
    func request<T: Codable>(request: APIProtocol, completion: @escaping NetworkCompletion<T>)
}

class Router: RouterProtocol {

    var task: URLSessionTask?
    var session: URLSession = URLSession.shared
    var urlBuilder: URLBuilderProtocol = URLBuilder()

    func request<T: Codable>(request: APIProtocol, completion: @escaping NetworkCompletion<T>) {
        guard let request = try? urlBuilder.buildRequest(with: request) else { return completion(.failure(.failed)) }
        task = session.dataTask(with: request, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                guard error == nil, let responseData = data else { return }
                do {
                    let response: T = try JSONDecoder().decode(T.self, from: responseData)
                    completion(.success(response))
                } catch {
                    completion(.failure(.failed))
                }
            }
        })

        task?.resume()
    }

}
