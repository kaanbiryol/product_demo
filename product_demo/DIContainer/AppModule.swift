//
//  AppModule.swift
//  product_demo
//
//  Created by Kaan Biryol on 26.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

struct AppModule {

    let networkRouter: NetworkRouterProtocol

    init(networkRouter: NetworkRouterProtocol = NetworkRouter()) {
        self.networkRouter = networkRouter
    }

}
