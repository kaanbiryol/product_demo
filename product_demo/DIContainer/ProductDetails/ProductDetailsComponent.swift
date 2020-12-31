//
//  ProductDetailsComponent.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

protocol ProductDetailsComponent {
    func makeProductDetailsViewModel(payload: ProductDetailsViewModelPayload) -> ProductDetailsViewModelProtocol
    func makeProductDetailsViewController(payload: ProductDetailsViewModelPayload) -> UIViewController
    func makeProductDetailsCoordinator(with navigationController: UINavigationController) -> ProductDetailsCoordinator
}
