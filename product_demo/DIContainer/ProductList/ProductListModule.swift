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

    func makeProductListRepository() -> ProductListRepositoryProtocol {
        return ProductListRepository(networkRouter)
    }

    func makeProductListViewModel() -> ProductListViewModelProtocol {
        return ProductListViewModel(prouctListService: makeProductListRepository())
    }

    func makeProductListViewController() -> UIViewController {
        return ProductListViewController(viewModel: makeProductListViewModel())
    }

    func makeProductListCoordinator(with navigationController: UINavigationController) -> ProductListCoordinator {
        return ProductListCoordinator(navigationController: navigationController, dependencies: self)
    }

}
