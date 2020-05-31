//
//  ProductListViewController+UISearchBar.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

extension ProductListViewController: UISearchBarDelegate, UISearchDisplayDelegate {

    func setupSearchController() {
        searchController = UISearchController()
        searchController.searchBar.placeholder = "Search a product..."
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }

    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchController.searchBar.text else { return }
        guard searchText.count >= Constants.minimumCharacterLimitForSearch else { return }
        viewModel.currentQuery = searchText
        fetchProducts()
        productListTableView.setContentOffset(.zero, animated: true)
    }

}
