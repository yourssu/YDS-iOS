//
//  YDSSimpleTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit

public class YDSSimpleTextField: UIView {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let fieldLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle3)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    private let textField: YDSBaseTextField = {
        let textField = YDSBaseTextField()
        return textField
    }()
    
    public var delegate: UITextFieldDelegate? {
        get {
            return textField.delegate
        }
        
        set(inputValue) {
            textField.delegate = inputValue
        }
    }
    
    public var inputDelegate: UITextInputDelegate? {
        get {
            return textField.inputDelegate
        }
        
        set(inputValue) {
            textField.inputDelegate = inputValue
        }
    }
    
    public var pasteDelegate: UITextPasteDelegate? {
        get {
            return textField.pasteDelegate
        }
        
        set(inputValue) {
            textField.pasteDelegate = inputValue
        }
    }
    
    public var textDragDelegate: UITextDragDelegate? {
        get {
            return textField.textDragDelegate
        }
        
        set(inputValue) {
            textField.textDragDelegate = inputValue
        }
    }
    
    public var textDropDelegate: UITextDropDelegate? {
        get {
            return textField.textDropDelegate
        }
        
        set(inputValue) {
            textField.textDropDelegate = inputValue
        }
    }
    
    private let helperLabel: YDSLabel = {
        let label = YDSLabel(style: .caption1)
        label.textColor = YDSColor.textTertiary
        return label
    }()
    
    public var isDisabled: Bool {
        get {
            return textField.isDisabled
        }
        
        set(inputValue) {
            setState()
            textField.isDisabled = inputValue
        }
    }
    
    public var isNegative: Bool {
        get {
            return textField.isNegative
        }
        
        set(inputValue) {
            setState()
            textField.isNegative = inputValue
        }
    }
    
    public var isPositive: Bool {
        get {
            return textField.isPositive
        }
        
        set(inputValue) {
            setState()
            textField.isPositive = inputValue
        }
    }
    
    public var clearButtonMode: UITextField.ViewMode {
        get {
            return textField.clearButtonMode
        }
        
        set(inputValue) {
            textField.clearButtonMode = inputValue
        }
    }
    
    public override func becomeFirstResponder() -> Bool {
        textField.becomeFirstResponder()
    }
    
    public var text: String? {
        get {
            return textField.text
        }
        
        set(inputValue) {
            textField.text = inputValue
        }
    }
    
    public var placeHolderText: String? {
        get {
            return textField.placeholder
        }
        
        set(inputValue) {
            setPlaceHolder(text: inputValue)
        }
    }
    
    public var fieldLabelText: String? {
        get {
            return fieldLabel.text
        }
        
        set(inputValue) {
            fieldLabel.text = inputValue
            
            if inputValue == nil {
                fieldLabel.isHidden = true
            } else {
                fieldLabel.isHidden = false
            }
        }
    }
    
    public var helperLabelText: String? {
        get {
            return helperLabel.text
        }
        
        set(inputValue) {
            helperLabel.text = inputValue
            
            if inputValue == nil {
                helperLabel.isHidden = true
            } else {
                helperLabel.isHidden = false
            }
        }
    }
    
    public init() {
        super.init(frame: CGRect.zero)
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        setStackView()
        setState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackView() {
        stackView.addArrangedSubview(fieldLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(helperLabel)
    }
    
    private func setState() {
        if self.isDisabled {
            fieldLabel.textColor = YDSColor.textDisabled
            setPlaceHolder(text: self.placeHolderText)
            helperLabel.textColor = YDSColor.textDisabled
            return
        }
        
        fieldLabel.textColor = YDSColor.textSecondary
        setPlaceHolder(text: self.placeHolderText)
        
        if self.isNegative {
            helperLabel.textColor = YDSColor.textWarned
            return
        }
        
        if self.isPositive {
            helperLabel.textColor = YDSColor.textTertiary
            return
        }
        
        helperLabel.textColor = YDSColor.textTertiary
    }
    
    private func setPlaceHolder(text: String?) {
        let placeHolderTextColor: UIColor
        
        if self.isDisabled {
            placeHolderTextColor = YDSColor.textDisabled
        } else {
            placeHolderTextColor = YDSColor.textTertiary
        }
        
        if let text = text {
            textField.attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeHolderTextColor]
            )
        }
    }
}

