//
//  UIStackView+AddArrangedSubviews.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/11.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        for view in views { addArrangedSubview(view) }
    }
}
