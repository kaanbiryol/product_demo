//
//  CompositionRoot.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

class CompositionRoot {

    func start(with scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(windowScene: scene)
        let productListViewController = makeProductListController()
        let navigationController = UINavigationController(rootViewController: productListViewController)
        window.backgroundColor = .systemBackground
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        return window
    }

}

extension CompositionRoot: HasProductList {}
