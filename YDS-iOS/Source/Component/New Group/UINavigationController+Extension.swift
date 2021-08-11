//
//  UINavigationController+Extension.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit

extension UINavigationBar {
    
    internal func removeButtonBarSpacing() {
        buttonBars?.forEach {
            let spaceConstraint = $0.constraints
                .filter { $0.description.contains("minimumInterItemSpace == 8") }
                .first
            if let constraint = spaceConstraint {
                $0.removeConstraint(constraint)
            }
        }
    }
    
    internal func setButtonBarProperties() {
        if (isTheFirstItemOfLeftBarUIButton) {
            leftButtonBar?.layoutMargins = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
            leftButtonBar?.alignment = .fill
            leftButtonBar?.spacing = 2
        }

        if (isTheFirstItemOfRightBarUIButton) {
            rightButtonBar?.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
            rightButtonBar?.alignment = .fill
            rightButtonBar?.spacing = 2
        }
    }
    
    internal var isTheFirstItemOfLeftBarUIButton: Bool {
        get {
            self.topItem?.leftBarButtonItems?.first?.customView is UIButton
        }
    }
    
    internal var isTheFirstItemOfRightBarUIButton: Bool {
        get {
            self.topItem?.rightBarButtonItems?.first?.customView is UIButton
        }
    }
    
    internal var contentView: UIView? {
        get { self.subviews
            .filter { $0.description.contains("ContentView") }
            .first
        }
    }
    
    internal var backgroundView: UIView? {
        get { self.subviews
            .filter { $0.description.contains("Background") }
            .first
        }
    }
    
    internal var buttonBars: [UIView]? {
        get { contentView?.subviews
            .filter { $0.description.contains("_UIButtonBarStackView") }
        }
    }
    
    internal var leftButtonBar: UIStackView? {
        get { buttonBars?.first as? UIStackView }
    }
    
    internal var rightButtonBar: UIStackView? {
        get { buttonBars?.last as? UIStackView }
    }
    
}
