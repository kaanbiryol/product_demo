//
//  HasProductListViewModel.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

protocol HasProductListViewModel: HasProductListRepository {
    var viewModel: ProductListViewModelProtocol { get }
}

extension HasProductListViewModel {
    var viewModel: ProductListViewModelProtocol {
        return ProductListViewModel(prouctListService: prouctListService)
    }
}
