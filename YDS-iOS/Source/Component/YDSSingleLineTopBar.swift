//
//  YDSSingleLineTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit

public class YDSSingleLineTopBar: UINavigationBar {

    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set(inputValue) {
            self.titleLabel.text = inputValue
        }
    }
        
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
        setLayouts()
    }
    
    private func setProperties() {
        self.pushItem(UINavigationItem(), animated: true)
        self.barTintColor = YDSColor.bgElevated
        self.tintColor = YDSColor.buttonNormal
        self.isTranslucent = false
        self.shadowImage = UIImage()
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear,
        ]
    }
    
    private func setLayouts() {
        setViewHierarchy()
    }
    
    private func setViewHierarchy() {
        self.topItem?.setLeftBarButton(UIBarButtonItem(customView: titleLabel), animated: true)
    }
        
    public override func layoutSubviews() {
        super.layoutSubviews()
  
        removeButtonBarSpacing()
        setButtonBarPadding()
    }
}

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
    
    internal func setButtonBarPadding() {
        if (isTheFirstItemOfLeftBarUIButton) {
            leftButtonBar?.layoutMargins = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
            leftButtonBar?.alignment = .fill
        }

        if (isTheFirstItemOfRightBarUIButton) {
            rightButtonBar?.layoutMargins = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: -8)
            rightButtonBar?.alignment = .fill
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
