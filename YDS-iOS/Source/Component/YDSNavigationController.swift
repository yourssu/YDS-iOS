//
//  YDSNavigationController.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

public class YDSNavigationController: UINavigationController, UINavigationBarDelegate {
    
    public var shouldPushLastViewController: Bool = false
    
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
    
    public override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        
        lastViewController = nil
        
        if viewControllers.count == 1 {
            titleLabel.text = title
            navigationBar.topItem?
                .setLeftBarButton(
                    UIBarButtonItem(customView: titleLabel),
                    animated: true
                )
        } else {
            navigationBar.topItem?
                .backBarButtonItem = UIBarButtonItem()
        }
    }
    
    private var lastViewController: UIViewController?
    
    public override func popViewController(animated: Bool) -> UIViewController? {
        lastViewController = super.popViewController(animated: animated)
        return lastViewController
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    private func setupView() {
        setProperties()
    }
    
    private func setProperties() {
        setBarAppearance()
        setNavigationBarProperties()
        
        let swipeGestureRecognizer: UISwipeGestureRecognizer = {
            let recognizer = UISwipeGestureRecognizer(target: self, action: #selector(pushLastViewController(_:)))
            recognizer.direction = .left
            return recognizer
        }()
        
        self.view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc
    private func pushLastViewController(_ sender: YDSNavigationController) {
        if shouldPushLastViewController == true {
            if let viewController = lastViewController {
                pushViewController(viewController, animated: true)
            }
        }
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
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        navigationBar.removeButtonBarSpacing()
        navigationBar.setButtonBarPadding()
    }
    
}

