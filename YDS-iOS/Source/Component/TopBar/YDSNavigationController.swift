//
//  YDSNavigationController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

public class YDSNavigationController: UINavigationController {
        
    public override var title: String? {
        didSet { self.titleLabel.text = title }
    }
        
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    public init(title: String?, rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.title = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupFullWidthBackGesture()
    }
    
    private func setupView() {
        setProperties()
    }
    
    private func setProperties() {
        setBarAppearance()
        setNavigationBarProperties()
    }
    

    private func setBarAppearance() {
        let barAppearance =
            UINavigationBar.appearance(whenContainedInInstancesOf: [YDSNavigationController.self])
        barAppearance.backIndicatorImage = YDSIcon.arrowLeftLine
        barAppearance.backIndicatorTransitionMaskImage = YDSIcon.arrowLeftLine
    }
    
    private func setNavigationBarProperties() {
        navigationBar.tintColor = YDSColor.buttonNormal
        navigationBar.isTranslucent = false
        navigationBar.shadowImage = UIImage()
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: YDSColor.textPrimary,
            NSAttributedString.Key.font: YDSFont.subtitle2,
        ]
    }
    
    private lazy var fullWidthBackGestureRecognizer = UIPanGestureRecognizer()
}


extension YDSNavigationController {
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        if viewControllers.count == 1 {
            titleLabel.text = title
            navigationBar.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel),
                                                    animated: true)
        } else {
            navigationBar.topItem?.backBarButtonItem = UIBarButtonItem()
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationBar.removeButtonBarSpacing()
        navigationBar.setButtonBarProperties()
    }
}


extension YDSNavigationController: UIGestureRecognizerDelegate {
    
    private func setupFullWidthBackGesture() {
        guard
            let interactivePopGestureRecognizer = interactivePopGestureRecognizer,
            let targets = interactivePopGestureRecognizer.value(forKey: "targets")
        else {
            return
        }

        fullWidthBackGestureRecognizer.setValue(targets, forKey: "targets")
        fullWidthBackGestureRecognizer.delegate = self
        view.addGestureRecognizer(fullWidthBackGestureRecognizer)
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let isSystemSwipeToBackEnabled = interactivePopGestureRecognizer?.isEnabled == true
        let isThereStackedViewControllers = viewControllers.count > 1
        return isSystemSwipeToBackEnabled && isThereStackedViewControllers
    }
    
}

