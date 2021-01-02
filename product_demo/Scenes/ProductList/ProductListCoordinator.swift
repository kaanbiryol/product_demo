//
//  ProductListCoordinator.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

class ProductListCoordinator {

    typealias Dependencies = ProductListComponent & ProductDetailsComponent

    private weak var navigationController: UINavigationController?
    private let dependencies: Dependencies

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start() {
        let actions = ProductListViewModelActions(didSelectProduct: routeToProductDetails)
        let viewController = dependencies.makeProductListViewController(actions: actions)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func routeToProductDetails(_ product: Product) {
        let coordinator = dependencies.makeProductDetailsCoordinator(with: navigationController!)
        coordinator.start(with: product)
    }

}
