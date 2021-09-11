//
//  UITableView+Generic.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/11.
//

import UIKit

protocol ReusableTableViewCell {
    static var reuseIdentifier: String { get }
}

extension ReusableTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableTableViewCell {}

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable Dequeue Reusable")
        }
        return cell
    }
}
