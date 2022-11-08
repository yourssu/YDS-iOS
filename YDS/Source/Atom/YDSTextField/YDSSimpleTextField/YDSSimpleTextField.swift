//
//  YDSSimpleTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit

/**
 YDSSimpleTextFieldView의 기본이 되는 textField 입니다.
 YDSSimpleTextField는 그 자체로 사용될 수 없습니다.
 */
public class YDSSimpleTextField: UITextField {

    // MARK: - 외부에서 지정할 수 있는 속성

    ///  필드를 비활성화 시킬 때 사용합니다.
    @SetNeeds(.display) internal var isDisabled: Bool = false

    ///  필드에 들어온 입력이 잘못되었음을 알릴 때 사용합니다.
    @SetNeeds(.display) internal var isNegative: Bool = false

    ///  필드에 들어온 입력이 제대로 되었음을 알릴 때 사용합니다.
    @SetNeeds(.display) internal var isPositive: Bool = false

    ///  새 값이 들어오면 setPlaceholderTextColor를 이용해
    ///  적절한 값을 가진 attributedPlaceholder로 변환합니다.
    public override var placeholder: String? {
        didSet { setNeedsDisplay() }
    }

    // MARK: - 내부에서 사용되는 상수

    ///  clearButton의 너비입니다.
    private var clearButtonWidth: CGFloat {
        return clearButtonRect(forBounds: bounds).width
    }

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
        self.clearButtonMode = .whileEditing

        self.clipsToBounds = true
        self.layer.cornerRadius = YDSConstant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        self.snp.makeConstraints {
            $0.height.equalTo(YDSTextField.Dimension.textFieldHeight)
        }

        setState()
    }

    ///  필드의 상태를 세팅합니다.
    ///  우선순위는 isDisabled > isNegative > isPositive 입니다.
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
            self.layer.borderWidth = YDSConstant.Border.normal
            self.layer.borderColor = YDSColor.textWarned.cgColor
            return
        }

        if isPositive {
            self.isEnabled = true
            self.textColor = YDSColor.textSecondary
            self.layer.borderWidth = YDSConstant.Border.normal
            self.layer.borderColor = YDSColor.textPointed.cgColor
            return
        }

        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
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
                attributes: [NSAttributedString.Key.foregroundColor: placeholderTextColor]
            )
        }
    }

    ///  clearButton의 Bound에 관한 함수입니다.
    ///  clearButton 우측 마진을 주기 위해 사용합니다.
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSTextField.Dimension.rightMargin
                                   - YDSTextField.Dimension.clearButtonDefaultRightMargin),
                             dy: 0
        )
    }

    ///  textRect의 Bound에 관한 함수입니다.
    ///  placeholder label의 너비를 설정하기 위해 사용합니다.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {

        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSTextField.Dimension.leftMargin,
                                             bottom: 0,
                                             right: (YDSTextField.Dimension.rightMargin
                                                     + self.clearButtonWidth
                                                     + YDSTextField.Dimension.subviewSpacing)
                                            ))
    }

    ///  editingRect의 Bound에 관한 함수입니다.
    ///  text label의 너비를 설정하기 위해 사용합니다.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSTextField.Dimension.leftMargin,
                                             bottom: 0,
                                             right: (YDSTextField.Dimension.rightMargin
                                                     + self.clearButtonWidth
                                                     + YDSTextField.Dimension.subviewSpacing)
                                            ))
    }

    public override func draw(_ rect: CGRect) {
        super.draw(rect)

        setState()
        setPlaceholderTextColor()
    }
}
