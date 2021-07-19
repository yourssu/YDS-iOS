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
        stackView.alignment = .center
        stackView.spacing = YDSSimpleTextField.subviewSpacing
        return stackView
    }()
    
    private let fieldLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle3)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    public let base: YDSSimpleTextFieldBase = {
        let textField = YDSSimpleTextFieldBase()
        return textField
    }()
    
    private let helperLabel: YDSLabel = {
        let label = YDSLabel(style: .caption1)
        label.textColor = YDSColor.textTertiary
        return label
    }()
    
    private static let subviewSpacing: CGFloat = 8
    private static let helperLabelHorizontalMargin: CGFloat = 8
    /*
    public var delegate: UITextFieldDelegate? {
        get {
            return base.delegate
        }
        
        set(inputValue) {
            base.delegate = inputValue
        }
    }
    
    public var inputDelegate: UITextInputDelegate? {
        get {
            return base.inputDelegate
        }
        
        set(inputValue) {
            base.inputDelegate = inputValue
        }
    }
    
    public var pasteDelegate: UITextPasteDelegate? {
        get {
            return base.pasteDelegate
        }
        
        set(inputValue) {
            base.pasteDelegate = inputValue
        }
    }
    
    public var textDragDelegate: UITextDragDelegate? {
        get {
            return base.textDragDelegate
        }
        
        set(inputValue) {
            base.textDragDelegate = inputValue
        }
    }
    
    public var textDropDelegate: UITextDropDelegate? {
        get {
            return base.textDropDelegate
        }
        
        set(inputValue) {
            base.textDropDelegate = inputValue
        }
    }
     */
    public var isDisabled: Bool = false {
        didSet {
            setState()
            base.isDisabled = self.isDisabled
        }
    }
    
    public var isNegative: Bool = false {
        didSet {
            setState()
            base.isNegative = self.isNegative
        }
    }

    public var isPositive: Bool = false {
        didSet {
            setState()
            base.isPositive = self.isPositive
        }
    }
    
    public var clearButtonMode: UITextField.ViewMode {
        get {
            return base.clearButtonMode
        }
        
        set(inputValue) {
            base.clearButtonMode = inputValue
        }
    }
    /*
    public override func becomeFirstResponder() -> Bool {
        base.becomeFirstResponder()
    }
    */
    public var text: String? {
        get {
            return base.text
        }
        
        set(inputValue) {
            base.text = inputValue
        }
    }
    
    public var placeHolderText: String? {
        get {
            return base.placeholder
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
        stackView.addArrangedSubview(base)
        stackView.addArrangedSubview(helperLabel)
        
        fieldLabel.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        base.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
        helperLabel.snp.makeConstraints {
            $0.width.equalToSuperview().offset(-YDSSimpleTextField.helperLabelHorizontalMargin*2)
        }
    }
    
    private func setState() {
        if self.isDisabled {
            fieldLabel.textColor = YDSColor.textDisabled
            setPlaceHolder(text: self.placeHolderText)
            helperLabel.textColor = YDSColor.textDisabled
            return
        }
        
        if self.isNegative {
            fieldLabel.textColor = YDSColor.textSecondary
            setPlaceHolder(text: self.placeHolderText)
            helperLabel.textColor = YDSColor.textWarned
            return
        }
        
        if self.isPositive {
            fieldLabel.textColor = YDSColor.textSecondary
            setPlaceHolder(text: self.placeHolderText)
            helperLabel.textColor = YDSColor.textTertiary
            return
        }
        
        fieldLabel.textColor = YDSColor.textSecondary
        setPlaceHolder(text: self.placeHolderText)
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
            base.attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeHolderTextColor]
            )
        }
    }
}

