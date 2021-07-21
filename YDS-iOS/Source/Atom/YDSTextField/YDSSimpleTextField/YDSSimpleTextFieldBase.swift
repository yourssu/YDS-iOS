//
//  YDSSimpleTextFieldBase.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

//
//  SimpleTextField의 기본이 되는 BaseTextField 입니다.
//
//  BaseTextField는 다른 TextField에서 사용될 수 있지만
//  BaseTextField 그 자체로 사용될 수 없습니다.
//

import UIKit

public class YDSSimpleTextFieldBase: UITextField {
    
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
    
    //  placeholder: String?
    //  새 값이 들어오면 setPlaceholderTextColor를 이용해
    //  적절한 값을 가진 attributedPlaceholder로 변환합니다.
    public override var placeholder: String? {
        didSet { setPlaceholderTextColor() }
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
    
    //  clearButtonDefaultRightMargin: CGFloat
    //  아무 설정을 하지 않았을 때 기본으로 주어지는 clearButton의 우측 마진 값입니다.
    private static let clearButtonDefaultRightMargin: CGFloat = 6
    
    //  clearButtonWidth: CGFloat
    //  clearButton의 너비입니다.
    private var clearButtonWidth: CGFloat {
        get {
            return clearButtonRect(forBounds: bounds).width
        }
    }
    
    
    //  MARK: - 메소드
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
        self.tintColor = YDSColor.textPointed
        self.clearButtonMode = .whileEditing
        
        self.layer.cornerRadius = Constant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSSimpleTextFieldBase.textFieldHeight)
        }
        
        setState()
    }
    
    //  setState()
    //  필드의 상태를 세팅합니다.
    //  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setState() {
        if isDisabled {
            self.isEnabled = false
            self.textColor = YDSColor.textDisabled
            setPlaceholderTextColor()
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }

        if isNegative {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            setPlaceholderTextColor()
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }
        
        if isPositive {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            setPlaceholderTextColor()
            self.layer.borderWidth = Constant.Border.normal
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }
        
        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        setPlaceholderTextColor()
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    
    //  setPlaceholderTextColor()
    //  isDisabled의 값에 따라 placeholder label의 색이 달라집니다.
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
    
    //  clearButtonRect()
    //  clearButton의 Bound에 관한 함수입니다.
    //  clearButton 우측 마진을 주기 위해 사용합니다.
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSSimpleTextFieldBase.rightMargin - YDSSimpleTextFieldBase.clearButtonDefaultRightMargin),
                             dy: 0
        )
    }
    
    //  textRect()
    //  textRect의 Bound에 관한 함수입니다.
    //  placeholder label의 너비를 설정하기 위해 사용합니다.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSimpleTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSimpleTextFieldBase.rightMargin + self.clearButtonWidth + YDSSimpleTextFieldBase.subviewSpacing
        ))
    }

    //  editingRect()
    //  editingRect의 Bound에 관한 함수입니다.
    //  text label의 너비를 설정하기 위해 사용합니다.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSimpleTextFieldBase.leftMargin,
                                             bottom: 0,
                                             right: YDSSimpleTextFieldBase.rightMargin + self.clearButtonWidth + YDSSimpleTextFieldBase.subviewSpacing
        ))
    }
    
}
