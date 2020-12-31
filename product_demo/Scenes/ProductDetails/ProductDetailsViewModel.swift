//
//  ProductDetailsViewModel.swift
//  product_demo
//
//  Created by Kaan Biryol on 27.12.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation

struct ProductDetailsViewModelPayload {
    let product: Product
    let didBuyProduct: (Product) -> Void
}

protocol ProductDetailsViewModelProtocol {
    var payload: ProductDetailsViewModelPayload { get }
//    var actions: ProductDetailsViewModelActions { get }
    func buy()
}

class ProductDetailsViewModel: ProductDetailsViewModelProtocol {

//    var actions: ProductDetailsViewModelActions
    var payload: ProductDetailsViewModelPayload

    //Generally use a Payload for sending payload
    init(payload: ProductDetailsViewModelPayload) {
        self.payload = payload
    }

    func buy() {
        payload.didBuyProduct(payload.product)
    }

    deinit {
        debugPrint("deinit viewmodel : \(self)")
    }

}
