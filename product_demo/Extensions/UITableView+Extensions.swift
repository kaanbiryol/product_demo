//
//  UITableView+Extensions.swift
//  product_demo
//
//  Created by Kaan Biryol on 31.05.2020.
//  Copyright © 2020 Kaan Biryol. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {

    func register(_ cell: UITableViewCell.Type) {
        register(cell.defaultNib, forCellReuseIdentifier: cell.defaultNibName)
    }

    func dequeue<T: UITableViewCell>(cell: T.Type) -> T {
        // swiftlint:disable force_cast
        return dequeueReusableCell(withIdentifier: cell.defaultNibName) as! T
    }

}

protocol NibLoadable: class {
    static var defaultNibName: String { get }
    static var bundle: Bundle? { get }
}

extension NibLoadable {

    public static var bundle: Bundle? {
        return Bundle(for: self)
    }
}

extension NibLoadable where Self: UIView {

    static var defaultNibName: String {
        return String(describing: self)
    }

    static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: bundle)
    }
}

extension UITableViewCell: NibLoadable { }
