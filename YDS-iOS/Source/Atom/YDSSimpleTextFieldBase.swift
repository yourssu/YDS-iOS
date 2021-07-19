//
//  YDSSimpleTextFieldBase.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

//
//  SimpleTextField의 기본이 되는 BaseTextField 입니다.
//  BaseTextField는 다른 TextField에서 사용될 수 있지만
//
//  BaseTextField 그 자체로 사용될 수 없습니다.
//

import UIKit

public class YDSSimpleTextFieldBase: UITextField {
    
    internal var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    internal var isNegative: Bool = false {
        didSet { setState() }
    }
    
    internal var isPositive: Bool = false {
        didSet { setState() }
    }
    
    private static let leftMargin: CGFloat = 16
    private static let rightMargin: CGFloat = 16
    private static let textFieldHeight: CGFloat = 48
    private static let subviewSpacing: CGFloat = 4
    private static let clearButtonDefaultRightMargin: CGFloat = 6
    private var clearButtonWidth: CGFloat {
        get {
            return clearButtonRect(forBounds: bounds).width
        }
    }
    
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
        self.clearButtonMode = .whileEditing
        
        self.layer.cornerRadius = Constant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSSimpleTextFieldBase.textFieldHeight)
        }
        
        setState()
    }
    
    private func setState() {
        if isDisabled {
            self.isEnabled = false
            self.textColor = YDSColor.textDisabled
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }

        if isNegative {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }
        
        if isPositive {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }
        
        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    
    // clearButton position
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSSimpleTextFieldBase.rightMargin - YDSSimpleTextFieldBase.clearButtonDefaultRightMargin),
                             dy: 0
        )
    }
    
    // placeholder position
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSimpleTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSimpleTextFieldBase.rightMargin + self.clearButtonWidth + YDSSimpleTextFieldBase.subviewSpacing
        ))
    }

    // text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSimpleTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSimpleTextFieldBase.rightMargin + self.clearButtonWidth + YDSSimpleTextFieldBase.subviewSpacing
        ))
    }
    
}
