//
//  MockViewController.swift
//  product_demoTests
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import XCTest
@testable import product_demo

class MockViewController: ProductListViewController {

    var fetchProductsCalled: Bool = false

    override func fetchProducts() {
        fetchProductsCalled = true
    }

}
