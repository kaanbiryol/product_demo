//
//  ProductDetailsCoordinator.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

final class ProductDetailsCoordinator {

    typealias Dependencies = ProductDetailsComponent

    private weak var navigationController: UINavigationController?
    private let dependencies: Dependencies

    init(navigationController: UINavigationController,
         dependencies: Dependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }

    func start(with product: Product) {
        let payload = ProductDetailsViewModelPayload(product: product, didBuyProduct: didBuyProduct(_:))
        let viewController = dependencies.makeProductDetailsViewController(payload: payload)
        navigationController?.pushViewController(viewController, animated: true)
    }

    func didBuyProduct(_ product: Product) {
        print("Did buy product: ", product)
        navigationController?.popViewController(animated: true)
    }

    deinit {
        debugPrint("deinit coordinator: \(self)")
    }

}
