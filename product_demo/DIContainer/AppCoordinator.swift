//
//  AppCoordinator.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator {

    private let navigationController: UINavigationController
    private let module: AppModule

    init(navigationController: UINavigationController,
         module: AppModule) {
        self.navigationController = navigationController
        self.module = module
    }

    func start() {
        let coordinator = module.makeProductListCoordinator(with: navigationController)
        coordinator.start()
    }

}
