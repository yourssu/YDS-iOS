//
//  YDSPasswordTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

//
//  비밀번호 입력을 위해 masking을 지원하고
//  입력 필드에 maskingButton이 붙은 TextField입니다.
//

import UIKit

public class YDSPasswordTextField: UIView {

    //  MARK: - 외부에서 지정할 수 있는 속성
    
    //  isDisabled: Bool
    //  필드를 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet {
            setState()
            base.isDisabled = self.isDisabled
        }
    }
    
    //  isNegative: Bool
    //  필드에 들어온 입력이 잘못되었음을 알릴 때 사용합니다.
    public var isNegative: Bool = false {
        didSet {
            setState()
            base.isNegative = self.isNegative
        }
    }

    //  isPositive: Bool
    //  필드에 들어온 입력이 제대로 되었음을 알릴 때 사용합니다.
    public var isPositive: Bool = false {
        didSet {
            setState()
            base.isPositive = self.isPositive
        }
    }
    
    //  isMasked: Bool
    //  필드에 들어온 입력이 마스킹 되어있는지 여부를 나타낼 때 사용합니다.
    public var isMasked: Bool = false {
        didSet {
            setState()
            base.isMasked = self.isMasked
        }
    }
    
    //  text: String?
    //  필드에 입력된 텍스트입니다.
    public var text: String? {
        get {
            return base.text
        }
        
        set(inputValue) {
            base.text = inputValue
        }
    }
    
    //  placeholder: String?
    //  필드에 나타나는 placeholder의 텍스트입니다.
    public var placeholder: String? {
        get {
            return base.placeholder
        }
        
        set(inputValue) {
            setPlaceholder(text: inputValue)
        }
    }
    
    //  fieldLabelText: String?
    //  필드 위쪽에 나타나는 fieldLabel의 텍스트입니다.
    //  nil이 들어오면 fieldLabel이 사라집니다.
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
    
    //  helperLabelText: String?
    //  필드 아래쪽에 나타나는 helperLabel의 텍스트입니다.
    //  nil이 들어오면 helperLabel이 사라집니다.
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
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    //  subviewSpacing: CGFloat
    //  fieldLabel, baseTextField, helperLabel 사이 간격입니다.
    private static let subviewSpacing: CGFloat = 8
    
    //  helperLabelHorizontalMargin: CGFloat
    //  helperLabel의 좌우 마진값입니다.
    private static let helperLabelHorizontalMargin: CGFloat = 8
    
    
    //  MARK: - 뷰
    
    //  stackView: UIStackView
    //  fieldLabel, baseTextField, helperLabel을 담는 stackView입니다.
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = YDSPasswordTextField.subviewSpacing
        return stackView
    }()
    
    //  fieldLabel: YDSLabel (UILabel)
    //  필드 위쪽에 나타나는 fieldlabel입니다.
    private let fieldLabel = YDSLabel(style: .subtitle3)
    
    //  base: YDSPasswordTextFieldBase (UITextField)
    //  필드 중앙의 실제 입력 필드입니다.
    //  public으로 열려있으니 delegate를 등록하거나 addTarget, endEditing 등의 메소드를 호출할 때
    //  passwordTextField.delegate 대신 passwordTextField.base.delegate 로 접근해주세요.
    public let base: YDSPasswordTextFieldBase = {
        let textField = YDSPasswordTextFieldBase()
        return textField
    }()
    
    //  helperLabel: YDSLabel (UILabel)
    //  필드 아래쪽에 나타나는 helperLabel입니다.
    private let helperLabel = YDSLabel(style: .caption1)
    
    
    // MARK: - 메소드
    
    public init() {
        super.init(frame: CGRect.zero)
        
        setStackView()
        setState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //  setStackView()
    //  stackView 내부를 세팅합니다.
    private func setStackView() {
        self.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.bottom.left.right.equalToSuperview()
        }
        
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
            $0.width.equalToSuperview().offset(-YDSPasswordTextField.helperLabelHorizontalMargin*2)
        }
    }
    
    //  setState()
    //  필드의 상태를 세팅합니다.
    //  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setState() {
        if self.isDisabled {
            fieldLabel.textColor = YDSColor.textDisabled
            setPlaceholder(text: self.placeholder)
            helperLabel.textColor = YDSColor.textDisabled
            return
        }
        
        if self.isNegative {
            fieldLabel.textColor = YDSColor.textSecondary
            setPlaceholder(text: self.placeholder)
            helperLabel.textColor = YDSColor.textWarned
            return
        }
        
        if self.isPositive {
            fieldLabel.textColor = YDSColor.textSecondary
            setPlaceholder(text: self.placeholder)
            helperLabel.textColor = YDSColor.textTertiary
            return
        }
        
        fieldLabel.textColor = YDSColor.textSecondary
        setPlaceholder(text: self.placeholder)
        helperLabel.textColor = YDSColor.textTertiary
    }
    
    //  setPlaceholder(text: String?)
    //  매개변수로 받은 text를 placeholder에 입력합니다.
    //  isDisabled의 값에 따라 placeholder label의 색이 달라집니다.
    private func setPlaceholder(text: String?) {
        let placeholderTextColor: UIColor
        
        if self.isDisabled {
            placeholderTextColor = YDSColor.textDisabled
        } else {
            placeholderTextColor = YDSColor.textTertiary
        }
        
        if let text = text {
            base.attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor]
            )
        }
    }
}
