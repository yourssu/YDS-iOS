//
//  YDSBottomBarController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit

open class YDSBottomBarController: UITabBarController {
    
    open override var viewControllers: [UIViewController]? {
        didSet { setTabBarItemImageInsets() }
    }
    
    private enum Dimension {
        static let itemImageVerticalInset: CGFloat = 6
    }
        
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .light)
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        feedbackGenerator.prepare()
        
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
    
    public func setTabBarItemImageInsets() {
        viewControllers?.forEach {
            if $0.tabBarItem.title == nil {
                $0.tabBarItem.imageInsets = UIEdgeInsets(top: Dimension.itemImageVerticalInset,
                                                         left: 0,
                                                         bottom: -Dimension.itemImageVerticalInset,
                                                         right: 0)
            }
        }
    }

}

extension YDSBottomBarController {
    
    private enum Transform {
        static let length: TimeInterval = Animation.Duration.medium
        static let scale: CGFloat = 1.2
        static let dumpingRatio: CGFloat = 0.5
    }
    
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        feedbackGenerator.impactOccurred()
        feedbackGenerator.prepare()
                
        guard let itemView = item.value(forKey: "view") as? UIView else { return }
        
        let propertyAnimator = UIViewPropertyAnimator(duration: Transform.length,
                                                      dampingRatio: 0.5) {
            itemView.transform = CGAffineTransform.identity.scaledBy(x: Transform.scale, y: Transform.scale)
        }
        propertyAnimator.addAnimations({ itemView.transform = .identity },
                                       delayFactor: CGFloat(Transform.length))
        propertyAnimator.startAnimation()
    }
    
}
