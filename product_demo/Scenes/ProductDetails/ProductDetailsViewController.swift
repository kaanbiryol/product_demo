//
//  ProductDetailsViewController.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

class ProductDetailsViewController: UIViewController {

    let viewModel: ProductDetailsViewModelProtocol

    init(viewModel: ProductDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("use custom init")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product Details"
    }

}
