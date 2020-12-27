//
//  ProductDetailsModule.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

extension AppModule: ProductDetailsComponent {

    func makeProductDetailsViewModel() -> ProductDetailsViewModelProtocol {
        return ProductDetailsViewModel()
    }

    func makeProductDetailsCoordinator(with navigationController: UINavigationController) -> ProductDetailsCoordinator {
        return ProductDetailsCoordinator(navigationController: navigationController, dependencies: self)
    }

    func makeProductDetailsViewController() -> UIViewController {
        return ProductDetailsViewController(viewModel: makeProductDetailsViewModel())
    }

}
