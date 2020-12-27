//
//  ProductListCoordinator.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

final class ProductListCoordinator {

    typealias Dependencies = ProductListComponent

    private weak var navigationController: UINavigationController?
    private let dependencies: Dependencies

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let viewController = dependencies.makeProductListViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }

}
