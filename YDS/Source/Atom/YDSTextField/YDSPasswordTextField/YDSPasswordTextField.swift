//
//  YDSPasswordTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit

/**
 YDSPasswordTextFieldView의 기본이 되는 textField 입니다.
 YDSPasswordTextField는 그 자체로 사용될 수 없습니다.
 */
public class YDSPasswordTextField: UITextField {
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    ///  필드를 비활성화 시킬 때 사용합니다.
    internal var isDisabled: Bool = false {
        didSet {
            setState()
            setPlaceholderTextColor()
        }
    }
    
    ///  필드에 들어온 입력이 잘못되었음을 알릴 때 사용합니다.
    internal var isNegative: Bool = false {
        didSet { setState() }
    }
    
    ///  필드에 들어온 입력이 제대로 되었음을 알릴 때 사용합니다.
    internal var isPositive: Bool = false {
        didSet { setState() }
    }
    
    ///  필드에 들어온 입력이 마스킹 되어있는지 여부를 나타낼 때 사용합니다.
    internal var isMasked: Bool = true {
        didSet { setMaskingState() }
    }
    
    ///  새 값이 들어오면 setPlaceholderTextColor를 이용해
    ///  적절한 값을 가진 attributedPlaceholder로 변환합니다.
    public override var placeholder: String? {
        didSet { setPlaceholderTextColor() }
    }
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    ///  maskingButton의 너비입니다.
    private var maskingButtonWidth: CGFloat {
        get { return rightViewRect(forBounds: bounds).width }
    }
    
    ///  masking 상태가 on임을 나타내는 아이콘입니다.
    private let maskingOnIcon = YDSIcon.starFilled.withRenderingMode(.alwaysTemplate)
    
    ///  masking 상태가 off임을 나타내는 아이콘입니다.
    private let maskingOffIcon = YDSIcon.starLine.withRenderingMode(.alwaysTemplate)
    
    
    //  MARK: - 뷰
    
    private let maskingButton: YDSPlainButton = {
        let button = YDSPlainButton()
        button.size = .medium
        return button
    }()
    
    
    // MARK: - 메소드
    internal init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ///  view를 세팅합니다.
    private func setupView() {
        self.font = YDSFont.body1
        self.tintColor = YDSColor.textPointed
        self.rightView = maskingButton
        self.rightViewMode = .always
        
        self.layer.cornerRadius = YDSConstant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSTextField.Dimension.textFieldHeight)
        }
        
        self.keyboardType = .asciiCapable
        self.clearsOnBeginEditing = false
        self.clearsOnInsertion = false
        self.maskingButton.addTarget(self, action: #selector(changeIsMaskedValue), for: .touchUpInside)
        
        setState()
        setMaskingState()
    }
    
    ///  필드의 상태를 세팅합니다.
    ///  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setState() {
        if isDisabled {
            self.isEnabled = false
            self.textColor = YDSColor.textDisabled
            maskingButton.tintColor = YDSColor.buttonDisabled
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }
        
        if isNegative {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            maskingButton.tintColor = YDSColor.buttonNormal
            self.layer.borderWidth = YDSConstant.Border.normal
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }
        
        if isPositive {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            maskingButton.tintColor = YDSColor.buttonNormal
            self.layer.borderWidth = YDSConstant.Border.normal
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }
        
        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        maskingButton.tintColor = YDSColor.buttonNormal
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    
    ///  필드의 마스킹 상태를 세팅합니다.
    private func setMaskingState() {
        self.isSecureTextEntry = isMasked
        
        if isMasked {
            maskingButton.setImage(maskingOnIcon, for: .normal)
        } else {
            maskingButton.setImage(maskingOffIcon, for: .normal)
        }
    }
    
    ///  isMasked의 값을 반전시킵니다.
    @objc
    private func changeIsMaskedValue() {
        self.isMasked = !self.isMasked
    }
    
    ///  isDisabled의 값에 따라 placeholder label의 색이 달라집니다.
    private func setPlaceholderTextColor() {
        let placeholderTextColor: UIColor
        
        if self.isDisabled {
            placeholderTextColor = YDSColor.textDisabled
        } else {
            placeholderTextColor = YDSColor.textTertiary
        }
        
        if let text = placeholder {
            attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor]
            )
        }
    }
    
    ///  rightView의 Bound에 관한 함수입니다.
    ///  maskingButton의 너비를 설정하기 위해 사용합니다.
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSTextField.Dimension.rightMargin), dy: 0)
    }
    
    ///  textRect의 Bound에 관한 함수입니다.
    ///  placeholder label의 너비를 설정하기 위해 사용합니다.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSTextField.Dimension.leftMargin,
                                             bottom: 0,
                                             right: YDSTextField.Dimension.rightMargin + self.maskingButtonWidth + YDSTextField.Dimension.subviewSpacing
                                            ))
    }
    
    ///  editingRect의 Bound에 관한 함수입니다.
    ///  text label의 너비를 설정하기 위해 사용합니다.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSTextField.Dimension.leftMargin,
                                             bottom: 0,
                                             right: YDSTextField.Dimension.rightMargin + self.maskingButtonWidth + YDSTextField.Dimension.subviewSpacing
                                            ))
    }
    
    ///  이 값이 바뀔 때마다 isFirstResponder를 체크한 후
    ///  becomeFirstResponder()를 실행시키도록 합니다.
    public override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }
    
    ///  이 메소드가 호출될 때 firstResponder가 되게 함과 동시에
    ///  기존에 필드에 입력된 값을 복사한 후, 임시 변수에 저장하고
    ///  기존에 필드에 입력된 값을 지운 후, 임시 변수에 저장한 값을 붙여넣습니다.
    ///  isSecureTextEntry 값이 false에서 true가 되면
    ///  false 상태일 때 입력된 값이 삭제되게 되는데
    ///  값이 삭제되기 전에 미리 지운 후 붙여넣어 값이 삭제되는 일을 방지합니다.
    public override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
    
    ///  붙여넣기를 차단합니다.
    ///  action이 paste(붙여넣기)이면 하지 못하도록 막습니다.
    public override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return false
        }
        return super.canPerformAction(action, withSender: sender)
    }
}
