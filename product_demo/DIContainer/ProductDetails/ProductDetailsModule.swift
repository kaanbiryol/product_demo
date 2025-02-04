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

    func makeProductDetailsViewModel(payload: ProductDetailsViewModelPayload) -> ProductDetailsViewModelProtocol {
        return ProductDetailsViewModel(payload: payload)
    }

    func makeProductDetailsCoordinator(with navigationController: UINavigationController) -> ProductDetailsCoordinator {
        return ProductDetailsCoordinator(navigationController: navigationController, dependencies: self)
    }

    func makeProductDetailsViewController(payload: ProductDetailsViewModelPayload) -> UIViewController {
        return ProductDetailsViewController(viewModel: makeProductDetailsViewModel(payload: payload))
    }

}
