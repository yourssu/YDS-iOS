//
//  UIViewController+Embed.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/11.
//

import UIKit

extension UIViewController {
    func embed(_ viewController: UIViewController) {
        viewController.willMove(toParent: self)
        self.addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
