//
//  ProductListComponent.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

protocol ProductListComponent {
    func makeProductListRepository() -> ProductListRepositoryProtocol
    func makeProductListViewModel() -> ProductListViewModelProtocol
    func makeProductListViewController() -> UIViewController
    func makeProductListCoordinator(with navigationController: UINavigationController) -> ProductListCoordinator
}
