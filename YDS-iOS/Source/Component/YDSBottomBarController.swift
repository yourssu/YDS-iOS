//
//  YDSBottomBarController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit

open class YDSBottomBarController: UITabBarController {
    
    private enum Dimension {
        static let iconSize = 24
    }
    
    private var verticalPadding: CGFloat {
        get {
            (tabBar.bounds.height - CGFloat(Dimension.iconSize))/2
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setProperties()
    }
    
    private func setProperties() {
        tabBar.tintColor = YDSColor.bottomBarSelected
        tabBar.unselectedItemTintColor = YDSColor.bottomBarNormal
        tabBar.backgroundColor = YDSColor.bgElevated
        tabBar.isTranslucent = false
    }

}
