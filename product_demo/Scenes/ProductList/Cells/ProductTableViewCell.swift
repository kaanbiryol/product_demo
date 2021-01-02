//
//  ProductTableViewCell.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import UIKit

protocol UITableViewCellProtocol {
    associatedtype ViewModel
    var viewModel: ViewModel! { get }
    func populate(with viewModel: ViewModel)
}

protocol ProductTableViewCellProtocol {
    var product: Product { get }
}

class ProductTableViewCellViewModel: ProductTableViewCellProtocol {
    var product: Product

    init(product: Product) {
        self.product = product
    }
}

class ProductTableViewCell: UITableViewCell, UITableViewCellProtocol {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!

    var viewModel: ProductTableViewCellProtocol!

    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
    }

    func populate(with viewModel: ProductTableViewCellProtocol) {
        self.viewModel = viewModel
        selectionStyle = .none
        let product: Product = viewModel.product
        productImageView.load(with: product.productImage)
        productTitleLabel.text = product.productName
        productDescriptionLabel.text = String(product.salesPriceIncVat) + "€"
    }
}
