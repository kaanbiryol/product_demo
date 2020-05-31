//
//  UIImageView+Extensions.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func load(with url: String?) {
        guard let urlString = url,
            let imageURL = URL(string: urlString) else {
                self.image = nil
                return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            URLSession.shared.dataTask(with: imageURL) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async {
                    self.transition(toImage: image)
                }
            }.resume()
        }
    }

    func transition(toImage image: UIImage?) {
        UIView.transition(with: self,
                          duration: 0.3,
                          options: [.transitionCrossDissolve],
                          animations: { [weak self] in
                            self?.image = image
        })
    }

}
