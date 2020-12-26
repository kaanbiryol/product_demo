//
//  ProductListBuilding.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

protocol HasProductList: HasProductListViewModel {
    func makeProductListController() -> UIViewController
}

extension HasProductList {

    func makeProductListController() -> UIViewController {
        let productListViewController = ProductListViewController(viewModel: viewModel)
        return productListViewController
    }

}
