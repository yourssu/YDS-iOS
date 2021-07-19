//
//  YDSSuffixTextFieldBase.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit

//
//  SuffixTextField의 기본이 되는 BaseTextField 입니다.
//  BaseTextField는 다른 TextField에서 사용될 수 있지만
//
//  BaseTextField 그 자체로 사용될 수 없습니다.
//

import UIKit

public class YDSSuffixTextFieldBase: UITextField {
    
    internal var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    internal var isNegative: Bool = false {
        didSet { setState() }
    }
    
    internal var isPositive: Bool = false {
        didSet { setState() }
    }
    
    internal var suffixLabelText: String? {
        get {
            return suffixLabel.text
        }
        
        set(inputValue) {
            suffixLabel.text = inputValue
            
            if inputValue == nil {
                suffixLabel.isHidden = true
            } else {
                suffixLabel.isHidden = false
            }
        }
    }
    
    private static let leftMargin: CGFloat = 16
    private static let rightMargin: CGFloat = 16
    private static let textFieldHeight: CGFloat = 48
    private static let subviewSpacing: CGFloat = 4
    
    private var suffixLabelWidth: CGFloat {
        get {
            return rightViewRect(forBounds: bounds).width
        }
    }
    
    private let suffixLabel: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.textColor = YDSColor.textTertiary
        return label
    }()
    
    internal init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.font = YDSFont.body1
        self.textColor = YDSColor.textSecondary
        self.tintColor = YDSColor.textPointed
        self.rightView = suffixLabel
        self.rightViewMode = .always
        
        self.layer.cornerRadius = Constant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSSuffixTextFieldBase.textFieldHeight)
        }
        
        setState()
    }
    
    private func setState() {
        if isDisabled {
            self.isEnabled = false
            self.textColor = YDSColor.textDisabled
            self.suffixLabel.textColor = YDSColor.textDisabled
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }

        if isNegative {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            self.suffixLabel.textColor = YDSColor.textTertiary
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }
        
        if isPositive {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            self.suffixLabel.textColor = YDSColor.textTertiary
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }
        
        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        self.suffixLabel.textColor = YDSColor.textTertiary
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    
    // suffixLabel position
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSSuffixTextFieldBase.rightMargin), dy: 0)
    }
    
    // placeholder position
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSuffixTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSuffixTextFieldBase.rightMargin + self.suffixLabelWidth + YDSSuffixTextFieldBase.subviewSpacing
        ))
    }

    // text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSuffixTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSuffixTextFieldBase.rightMargin + self.suffixLabelWidth + YDSSuffixTextFieldBase.subviewSpacing
        ))
    }
    
}

