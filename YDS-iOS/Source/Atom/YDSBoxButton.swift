//
//  YDSBoxButton.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/21.
//

import UIKit

public class YDSBoxButton: UIButton {
    
    public override var isHighlighted: Bool {
        didSet {
            if oldValue != isHighlighted {
                setBoxButtonColor()
            }
        }
    }

    public enum BoxButtonType {
        case filled
        case tinted
        case line
    }
    
    public enum BoxButtonSize: Int {
        case extraLarge
        case large
        case medium
        case small
        
        fileprivate var padding: CGFloat {
            switch self {
            case .extraLarge:
                return 16
            case .large:
                return 16
            case .medium:
                return 12
            case .small:
                return 12
            }
        }
        
        fileprivate var height: CGFloat {
            switch self {
            case .extraLarge:
                return 56
            case .large:
                return 48
            case .medium:
                return 40
            case .small:
                return 32
            }
        }
        
        fileprivate var font: UIFont {
            switch self {
            case .extraLarge:
                return YDSFont.button1
            case .large:
                return YDSFont.button2
            case .medium:
                return YDSFont.button2
            case .small:
                return YDSFont.button4
            }
        }
        
        fileprivate var iconSize: CGFloat {
            switch self {
            case .extraLarge:
                return 24
            case .large:
                return 24
            case .medium:
                return 24
            case .small:
                return 16
            }
        }
    }
    
    public enum BoxButtonRounding: Int {
        case r8 = 8
        case r4 = 4
    }
    
    public var isDisabled: Bool = false {
        didSet { setBoxButtonColor() }
    }
    
    public var isWarned: Bool = false {
        didSet { setBoxButtonColor() }
    }
    
    public var type: BoxButtonType = .filled {
        didSet { setBoxButtonColor() }
    }
    
    public var size: BoxButtonSize = .large {
        didSet { setBoxButtonSize() }
    }
    
    public var rounding: BoxButtonRounding = .r4 {
        didSet { setBoxButtonRounding() }
    }
    
    public var text: String? = nil {
        didSet { setTitle(text, for: .normal) }
    }
    
    public var leftIcon: UIImage? = nil {
        didSet { setIcon() }
    }
    
    public var rightIcon: UIImage? = nil {
        didSet { setIcon() }
    }
    
    private static let subviewSpacing: CGFloat = 4

    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.clipsToBounds = true
        self.adjustsImageWhenHighlighted = false
        self.adjustsImageWhenDisabled = false
        
        setBoxButtonSize()
        setBoxButtonColor()
        setBoxButtonRounding()
    }
    
    private func setBoxButtonColor() {
        
        self.isEnabled = !isDisabled
        
        switch(type) {
        case .filled:
            var foregroundColor: UIColor
            var foregroundPressedColor: UIColor
            var backgroundColor: UIColor
            var backgroundPressedColor: UIColor
            
            if isDisabled {
                foregroundColor = YDSColor.buttonDisabled
                foregroundPressedColor = YDSColor.buttonDisabled
                backgroundColor = YDSColor.buttonDisabledBG
                backgroundPressedColor = YDSColor.buttonDisabledBG
            } else if isWarned {
                foregroundColor = YDSColor.buttonReversed
                foregroundPressedColor = YDSColor.buttonReversed
                backgroundColor = YDSColor.buttonWarned
                backgroundPressedColor = YDSColor.buttonWarnedPressed
            } else {
                foregroundColor = YDSColor.buttonReversed
                foregroundPressedColor = YDSColor.buttonReversed
                backgroundColor = YDSColor.buttonPoint
                backgroundPressedColor = YDSColor.buttonPointPressed
            }
            
            setBackgroundColor(backgroundColor, for: .normal)
            setBackgroundColor(backgroundPressedColor, for: .highlighted)
            
            setTitleColor(foregroundColor, for: .normal)
            setTitleColor(foregroundPressedColor, for: .highlighted)
            
            self.tintColor = !isHighlighted
                ? foregroundColor
                : foregroundPressedColor
            
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            
        case .tinted:
            var foregroundColor: UIColor
            var foregroundPressedColor: UIColor
            var backgroundColor: UIColor
            var backgroundPressedColor: UIColor
            
            if isDisabled {
                foregroundColor = YDSColor.buttonDisabled
                foregroundPressedColor = YDSColor.buttonDisabled
                backgroundColor = YDSColor.buttonDisabledBG
                backgroundPressedColor = YDSColor.buttonDisabledBG
            } else if isWarned {
                foregroundColor = YDSColor.buttonWarned
                foregroundPressedColor = YDSColor.buttonWarnedPressed
                backgroundColor = YDSColor.buttonWarnedBG
                backgroundPressedColor = YDSColor.buttonWarnedBG
            } else {
                foregroundColor = YDSColor.buttonPoint
                foregroundPressedColor = YDSColor.buttonPointPressed
                backgroundColor = YDSColor.buttonPointBG
                backgroundPressedColor = YDSColor.buttonPointBG
            }
            
            setBackgroundColor(backgroundColor, for: .normal)
            setBackgroundColor(backgroundPressedColor, for: .highlighted)
            
            setTitleColor(foregroundColor, for: .normal)
            setTitleColor(foregroundPressedColor, for: .highlighted)
            
            self.tintColor = !isHighlighted
                ? foregroundColor
                : foregroundPressedColor
            
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            
        case .line:
            var foregroundColor: UIColor
            var foregroundPressedColor: UIColor
            
            if isDisabled {
                foregroundColor = YDSColor.buttonDisabled
                foregroundPressedColor = YDSColor.buttonDisabled
            } else if isWarned {
                foregroundColor = YDSColor.buttonWarned
                foregroundPressedColor = YDSColor.buttonWarnedPressed
            } else {
                foregroundColor = YDSColor.buttonPoint
                foregroundPressedColor = YDSColor.buttonPointPressed
            }
            
            setBackgroundColor(UIColor.clear, for: .normal)
            setBackgroundColor(UIColor.clear, for: .highlighted)
            
            setTitleColor(foregroundColor, for: .normal)
            setTitleColor(foregroundPressedColor, for: .highlighted)
            
            self.tintColor = !isHighlighted
                ? foregroundColor
                : foregroundPressedColor
            
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = !isHighlighted
                ? foregroundColor.cgColor
                : foregroundPressedColor.cgColor
        }

    }
    
    private func setBoxButtonSize() {
        self.snp.updateConstraints {
            $0.height.equalTo(size.height)
        }
 
        self.titleLabel?.font = size.font
        setIcon()
    }
    
    private func setBoxButtonRounding() {
        self.layer.cornerRadius = CGFloat(rounding.rawValue)
    }
    
    private func setIcon() {
        if leftIcon != nil {
            self.setImage(self.leftIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            
            self.semanticContentAttribute = .forceLeftToRight
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSBoxButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSBoxButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: size.padding+YDSBoxButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: size.padding+YDSBoxButton.subviewSpacing/2)
            return
        }
        
        if rightIcon != nil {
            self.setImage(self.rightIcon?
                            .resize(to: size.iconSize)
                            .withRenderingMode(.alwaysTemplate),
                          for: .normal)
            
            self.semanticContentAttribute = .forceRightToLeft
            self.imageEdgeInsets = UIEdgeInsets(top: 0,
                                                left: YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: -YDSBoxButton.subviewSpacing/2)
            self.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: -YDSBoxButton.subviewSpacing/2,
                                                bottom: 0,
                                                right: YDSBoxButton.subviewSpacing/2)
            self.contentEdgeInsets = UIEdgeInsets(top: 0,
                                                  left: size.padding+YDSBoxButton.subviewSpacing/2,
                                                  bottom: 0,
                                                  right: size.padding+YDSBoxButton.subviewSpacing/2)
            return
        }
        
        self.setImage(nil, for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.contentEdgeInsets = UIEdgeInsets(top: 0, left: size.padding, bottom: 0, right: size.padding)
        return
    }

}

extension UIButton {
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        UIGraphicsBeginImageContext(CGSize(width: 1.0, height: 1.0))
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0))
        
        let backgroundImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
         
        self.setBackgroundImage(backgroundImage, for: state)
    }
}
