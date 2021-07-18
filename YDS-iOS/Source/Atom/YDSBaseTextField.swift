//
//  YDSBaseTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

//
//  모든 TextField의 기본이 되는 BaseTextField 입니다.
//  BaseTextField는 다른 TextField에서 사용될 수 있지만
//
//  BaseTextField 그 자체로 사용될 수 없습니다.
//

import UIKit

internal class YDSBaseTextField: UITextField {
    
    internal var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    internal var isNegative: Bool = false {
        didSet { setState() }
    }
    
    internal var isPositive: Bool = false {
        didSet { setState() }
    }
    
    internal init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.font = .systemFont(ofSize: 15, weight: .regular)
        self.textColor = YDSColor.textSecondary
        self.tintColor = YDSColor.textPointed
        self.clearButtonMode = .whileEditing
        
        self.layer.cornerRadius = 8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        setState()
    }
    
    private func setState() {
        if isDisabled {
            self.isEnabled = false
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }
        
        self.isEnabled = true

        if isNegative {
            self.layer.borderWidth = 1
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }
        
        if isPositive {
            self.layer.borderWidth = 1
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }
        
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    
    // clearbutton position
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect{
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -10, dy: 0)
    }
    
    // placeholder position
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16+16+4))
    }

    // text position
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16+16+4))
    }
    
}
