//
//  UINavigationController+Extension.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit

extension UINavigationBar {
    
    /**
     UINavigationBar의 Layout을 Custom 할 때 사용하는
     각종 상수입니다.
     */
    private enum Dimension {
        enum ButtonBar {
            static let spacing: CGFloat = 2
            enum Padding {
                static let horizontal: CGFloat = 8
            }
        }
    }
    
    /**
     UINavigationBar 내부에 StackView로 구현된
     LeftButtonBar와 RightButtonBar의
     minimumInterItemSpace 관련 Constraint를 제거합니다.
     */
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
    
    /**
     UINavigationBar 내부에 구현된
     LeftButtonBar와 RightButtonBar 각각의
     첫 번째 Item이 UIButton일 때 Property를 설정합니다.
     */
    internal func setButtonBarProperties() {
        if (isTheFirstItemOfLeftBarUIButton) {
            leftButtonBar?.layoutMargins = UIEdgeInsets(top: 0,
                                                        left: -Dimension.ButtonBar.Padding.horizontal,
                                                        bottom: 0,
                                                        right: Dimension.ButtonBar.Padding.horizontal)
            leftButtonBar?.alignment = .fill
            leftButtonBar?.spacing = Dimension.ButtonBar.spacing
        }

        if (isTheFirstItemOfRightBarUIButton) {
            rightButtonBar?.layoutMargins = UIEdgeInsets(top: 0,
                                                         left: Dimension.ButtonBar.Padding.horizontal,
                                                         bottom: 0,
                                                         right: -Dimension.ButtonBar.Padding.horizontal)
            rightButtonBar?.alignment = .fill
            rightButtonBar?.spacing = Dimension.ButtonBar.spacing
        }
    }
    
    /**
     UINavigationBar 최상단 leftBarButtonItems의
     첫 번째 Item이 UIButton인지 판단합니다.
     */
    internal var isTheFirstItemOfLeftBarUIButton: Bool {
        get {
            self.topItem?.leftBarButtonItems?.first?.customView is UIButton
        }
    }
    
    /**
     UINavigationBar 최상단 rightBarButtonItem의
     첫 번째 Item이 UIButton인지 판단합니다.
     */
    internal var isTheFirstItemOfRightBarUIButton: Bool {
        get {
            self.topItem?.rightBarButtonItems?.first?.customView is UIButton
        }
    }
    
    /**
     UINavigationBar 내부의 contentView입니다.
     */
    internal var contentView: UIView? {
        get { self.subviews
            .filter { $0.description.contains("ContentView") }
            .first
        }
    }
    
    /**
     UINavigationBar 내부의 backgroundView입니다.
     */
    internal var backgroundView: UIView? {
        get { self.subviews
            .filter { $0.description.contains("Background") }
            .first
        }
    }
    
    /**
     UINavigationBar 내부의 buttonBar의 배열입니다.
     */
    internal var buttonBars: [UIView]? {
        get { contentView?.subviews
            .filter { $0.description.contains("_UIButtonBarStackView") }
        }
    }
    
    /**
     UINavigationBar 내부의 leftButtonBar입니다.
     */
    internal var leftButtonBar: UIStackView? {
        get { buttonBars?.first as? UIStackView }
    }
    
    /**
     UINavigationBar 내부의 rightButtonBar입니다.
     */
    internal var rightButtonBar: UIStackView? {
        get { buttonBars?.last as? UIStackView }
    }
    
}
