//
//  ProductListDependencies.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

extension AppModule: ProductListComponent {

    func makeProductListViewModel(actions: ProductListViewModelActions) -> ProductListViewModelProtocol {
        return ProductListViewModel(dependencies: self,
                                    actions: actions)
    }

    func makeProductListViewController(actions: ProductListViewModelActions) -> UIViewController {
        return ProductListViewController(viewModel: makeProductListViewModel(actions: actions))
    }

    func makeProductListCoordinator(with navigationController: UINavigationController) -> ProductListCoordinator {
        return ProductListCoordinator(navigationController: navigationController, dependencies: self)
    }

}

extension AppModule: HasProductListRepository {
    var productListRepository: ProductListRepositoryProtocol {
        return ProductListRepository(networkRouter)
    }
}
