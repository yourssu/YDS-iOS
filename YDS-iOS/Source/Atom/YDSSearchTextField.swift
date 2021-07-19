//
//  YDSSearchTextField.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/20.
//

import UIKit

public class YDSSearchTextField: UITextField {

    //  MARK: - 외부에서 지정할 수 있는 속성
    
    //  isDisabled: Bool
    //  필드를 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    public override var placeholder: String? {
        didSet { setPlaceHolder() }
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
    private static let textFieldHeight: CGFloat = 38
    
    //  subviewSpacing: CGFloat
    //  필드 내 요소 사이 간격입니다. searchIcon과 textLabel과 cleaButton 사이 거리로 사용됩니다.
    private static let subviewSpacing: CGFloat = 4
    
    //  searchIconDefaultLeftMargin: CGFloat
    //  아무 설정을 하지 않았을 때 기본으로 주어지는 searchIcon의 우측 마진 값입니다.
    private static let searchIconDefaultLeftMargin: CGFloat = 6
    
    //  clearButtonDefaultRightMargin: CGFloat
    //  아무 설정을 하지 않았을 때 기본으로 주어지는 clearButton의 우측 마진 값입니다.
    private static let clearButtonDefaultRightMargin: CGFloat = 6
    
    
    //  searchIconWidth: CGFloat
    //  searchIcon의 너비입니다.
    private var searchIconWidth: CGFloat {
        get {
            return searchIcon.frame.width
        }
    }
    
    //  clearButtonWidth: CGFloat
    //  clearButton의 너비입니다.
    private var clearButtonWidth: CGFloat {
        get {
            return clearButtonRect(forBounds: bounds).width
        }
    }
    
    
    //  MARK: - 뷰
    
    //  searchIcon: YDSIconView (UIImageView)
    //  필드 왼쪽에 나타나는 searchIcon입니다.
    private let searchIcon: YDSIconView = {
        let icon = YDSIconView()
        icon.image = YDSIcon.searchLine.withRenderingMode(.alwaysTemplate)
        icon.tintColor = YDSColor.textSecondary
        icon.size = .extraSmall
        return icon
    }()
    
    
    //  MARK: - 메소드
    public init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //  setupView()
    //  view를 세팅합니다.
    private func setupView() {
        self.font = YDSFont.body2
        self.textColor = YDSColor.textSecondary
        self.tintColor = YDSColor.textPointed
        self.clearButtonMode = .whileEditing
        
        self.addSubview(searchIcon)
        searchIcon.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(YDSSearchTextField.leftMargin)
            $0.centerY.equalToSuperview()
        }
        
        self.layer.cornerRadius = Constant.Rounding.r8
        self.backgroundColor = YDSColor.inputFieldElevated
        
        self.snp.makeConstraints {
            $0.height.equalTo(YDSSearchTextField.textFieldHeight)
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
            self.layer.borderWidth = 0
            self.layer.borderColor = nil
            return
        }
        
        self.isEnabled = true
        self.textColor = YDSColor.textSecondary
        self.layer.borderWidth = 0
        self.layer.borderColor = nil
    }
    

    //  clearButtonRect()
    //  clearButton의 Bound에 관한 함수입니다.
    //  clearButton 우측 마진을 주기 위해 사용합니다.
    public override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.clearButtonRect(forBounds: bounds)
        return rect.offsetBy(dx: -(YDSSearchTextField.rightMargin - YDSSearchTextField.clearButtonDefaultRightMargin),
                             dy: 0
        )
    }
    
    //  textRect()
    //  textRect의 Bound에 관한 함수입니다.
    //  placeholder label의 너비를 설정하기 위해 사용합니다.
    public override func textRect(forBounds bounds: CGRect) -> CGRect {
        
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSearchTextField.leftMargin + self.searchIconWidth + YDSSearchTextField.subviewSpacing,
                                             bottom: 0,
                                             right: YDSSearchTextField.rightMargin + self.clearButtonWidth + YDSSearchTextField.subviewSpacing
        ))
    }

    //  editingRect()
    //  editingRect의 Bound에 관한 함수입니다.
    //  text label의 너비를 설정하기 위해 사용합니다.
    public override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: 0,
                                             left: YDSSearchTextField.leftMargin + self.searchIconWidth + YDSSearchTextField.subviewSpacing,
                                             bottom: 0,
                                             right: YDSSearchTextField.rightMargin + self.clearButtonWidth + YDSSearchTextField.subviewSpacing
        ))
    }
    
    //  setPlaceHolder()
    //  isDisabled의 값에 따라 placeholder label의 색이 달라집니다.
    private func setPlaceHolder() {
        let placeHolderTextColor: UIColor
        
        if self.isDisabled {
            placeHolderTextColor = YDSColor.textDisabled
        } else {
            placeHolderTextColor = YDSColor.textTertiary
        }
        
        if let text = placeholder {
            attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeHolderTextColor]
            )
        }
    }

}
