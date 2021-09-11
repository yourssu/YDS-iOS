//
//  UIView+AddSubviews.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/11.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
