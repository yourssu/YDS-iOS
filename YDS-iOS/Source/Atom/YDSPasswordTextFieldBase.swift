//
//  YDSPasswordTextFieldBase.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

//
//  PasswordTextField의 기본이 되는 BaseTextField 입니다.
//
//  BaseTextField는 다른 TextField에서 사용될 수 있지만
//  BaseTextField 그 자체로 사용될 수 없습니다.
//

import UIKit

public class YDSPasswordTextFieldBase: UITextField {
    
    //  MARK: - 외부에서 지정할 수 있는 속성
    
    //  isDisabled: Bool
    //  필드를 비활성화 시킬 때 사용합니다.
    internal var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    //  isNegative: Bool
    //  필드에 들어온 입력이 잘못되었음을 알릴 때 사용합니다.
    internal var isNegative: Bool = false {
        didSet { setState() }
    }
    
    //  isPositive: Bool
    //  필드에 들어온 입력이 제대로 되었음을 알릴 때 사용합니다.
    internal var isPositive: Bool = false {
        didSet { setState() }
    }
    
    //  isMasked: Bool
    //  필드에 들어온 입력이 마스킹 되어있는지 여부를 나타낼 때 사용합니다.
    internal var isMasked: Bool = true {
        didSet { setMaskingState() }
    }
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    //  leftMargin: CGFloat
    //  필드 좌측 마진값입니다.
    private static let leftMargin: CGFloat = 16
    
    //  rightMargin: CGFloat
    //  필드 우측 마진값입니다.
    private static let rightMargin: CGFloat = 16
    
    //  textFieldHeight: CGFloat
    //  필드 높이입니다.
    private static let textFieldHeight: CGFloat = 48
    
    //  subviewSpacing: CGFloat
    //  필드 내 요소 사이 간격입니다. text label과 cleaButton 사이 거리로 사용됩니다.
    private static let subviewSpacing: CGFloat = 4
    
    //  maskingButtonWidth: CGFloat
    //  maskingButton의 너비입니다.
    private var maskingButtonWidth: CGFloat {
        get {
            return rightViewRect(forBounds: bounds).width
        }
    }
    
    //  maskingOnIcon: YDSIcon (UIImage)
    //  masking 상태가 on임을 나타내는 아이콘입니다.
    private let maskingOnIcon = YDSIcon.starFilled.withRenderingMode(.alwaysTemplate)
    
    //  maskingOffIcon: YDSIcon (UIImage)
    //  masking 상태가 off임을 나타내는 아이콘입니다.
    private let maskingOffIcon = YDSIcon.starLine.withRenderingMode(.alwaysTemplate)
    
    
    //  MARK: - 뷰
    
    private let maskingButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        button.tintColor = YDSColor.buttonNormal
        button.adjustsImageWhenHighlighted = false
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
    
    
    //  setupView()
    //  view를 세팅합니다.
    private func setupView() {
        self.font = YDSFont.body1
        self.textColor = YDSColor.textSecondary
        self.tintColor = YDSColor.textPointed
        self.rightView = maskingButton
        self.rightViewMode = .always
        
        self.layer.cornerRadius = Constant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSPasswordTextFieldBase.textFieldHeight)
        }
        
        self.clearsOnBeginEditing = false
        self.clearsOnInsertion = false
        self.maskingButton.addTarget(self, action: #selector(changeIsMaskedValue), for: .touchUpInside)
        
        setState()
        setMaskingState()
    }
    
    //  setState()
    //  필드의 상태를 세팅합니다.
    //  우선순위는 isDisabled > isNegative > isPositive 입니다.
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
    
    //  setState()
    //  필드의 마스킹 상태를 세팅합니다.
    private func setMaskingState() {
        self.isSecureTextEntry = isMasked
        
        if isMasked {
            maskingButton.setImage(maskingOnIcon, for: .normal)
        } else {
            maskingButton.setImage(maskingOffIcon, for: .normal)
        }
    }
    
    //  changeIsMaskedValue()
    //  isMasked의 값을 반전시킵니다.
    @objc
    private func changeIsMaskedValue() {
        self.isMasked = !self.isMasked
    }
    
    //  rightViewRect()
    //  rightView의 Bound에 관한 함수입니다.
    //  maskingButton의 너비를 설정하기 위해 사용합니다.
    public override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.rightViewRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSPasswordTextFieldBase.rightMargin), dy: 0)
    }
    
    //  textRect()
    //  textRect의 Bound에 관한 함수입니다.
    //  placeholder label의 너비를 설정하기 위해 사용합니다.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSPasswordTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSPasswordTextFieldBase.rightMargin + self.maskingButtonWidth + YDSPasswordTextFieldBase.subviewSpacing
        ))
    }

    //  editingRect()
    //  editingRect의 Bound에 관한 함수입니다.
    //  text label의 너비를 설정하기 위해 사용합니다.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSPasswordTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSPasswordTextFieldBase.rightMargin + self.maskingButtonWidth + YDSPasswordTextFieldBase.subviewSpacing
        ))
    }
    
    //  isSecureTextEntry
    //  이 값이 바뀔 때마다 isFirstResponder를 체크한 후
    //  becomeFirstResponder()를 실행시키도록 합니다.
    public override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }

    //  becomeFirstResponder()
    //  이 메소드가 호출될 때 firstResponder가 되게 함과 동시에
    //  기존에 필드에 입력된 값을 복사한 후, 임시 변수에 저장하고
    //  기존에 필드에 입력된 값을 지운 후, 임시 변수에 저장한 값을 붙여넣습니다.
    //  isSecureTextEntry 값이 false에서 true가 되면
    //  false 상태일 때 입력된 값이 삭제되게 되는데
    //  값이 삭제되기 전에 미리 지운 후 붙여넣어 값이 삭제되는 일을 방지합니다.
    public override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            self.text?.removeAll()
            insertText(text)
        }
        return success
    }
}

