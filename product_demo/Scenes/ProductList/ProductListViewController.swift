//
//  ViewController.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController {

    enum Constants {
        static let minimumCharacterLimitForSearch = 3
    }

    @IBOutlet weak var productListTableView: UITableView!

    var searchController: UISearchController!
    let viewModel: ProductListViewModelProtocol

    init(viewModel: ProductListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("use custom init")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Product List"
        setupSearchController()
        setupTableView()
    }

    func fetchProducts() {
        viewModel.fetchProductList(completion: { [weak self] (_) in
            self?.productListTableView.reloadData()
        }) { [weak self] (_) in
            self?.productListTableView.reloadData()
        }
    }

}
