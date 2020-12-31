//
//  ProductListComponent.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

protocol HasProductListRepository {
    var productListRepository: ProductListRepositoryProtocol { get }
}

protocol ProductListComponent {
    func makeProductListViewModel(actions: ProductListViewModelActions) -> ProductListViewModelProtocol
    func makeProductListViewController(actions: ProductListViewModelActions) -> UIViewController
    func makeProductListCoordinator(with navigationController: UINavigationController) -> ProductListCoordinator
}
