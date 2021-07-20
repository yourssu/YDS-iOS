//
//  YDSSearchBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/07/20.
//

import UIKit

public class YDSSearchBar: UISearchBar {

    //  MARK: - 외부에서 지정할 수 있는 속성
    
    //  isDisabled: Bool
    //  필드를 비활성화 시킬 때 사용합니다.
    public var isDisabled: Bool = false {
        didSet { setState() }
    }
    
    //  placeholder: String?
    //  새 값이 들어오면 setPlaceholderTextColor를 이용해
    //  적절한 값을 가진 attributedPlaceholder로 변환합니다.
    public override var placeholder: String? {
        didSet { setPlaceholderTextColor() }
    }
    
    
    //  MARK: - 내부에서 사용되는 상수
    
    //  outsideLeftMargin: CGFloat
    //  필드 외부 좌측 마진값입니다.
    private static let outsideLeftMargin: CGFloat = 16
    
    //  outsideRightMargin: CGFloat
    //  필드 외부 우측 마진값입니다.
    private static let outsideRightMargin: CGFloat = 16
    
    //  leftMargin: CGFloat
    //  필드 내부 좌측 마진값입니다.
    private static let leftMargin: CGFloat = 16
    
    //  rightMargin: CGFloat
    //  필드 내부 우측 마진값입니다.
    private static let rightMargin: CGFloat = 16
    
    //  searchBarHeight: CGFloat
    //  서치바 전체 높이입니다.
    private static let searchBarHeight: CGFloat = 44
    
    //  searchIconSize: CGFloat
    //  searchIcon의 사이즈입니다.
    private static let searchIconSize: CGFloat = 16
    
    //  searchIconDefaultLeftMargin: CGFloat
    //  아무 설정을 하지 않았을 때 기본으로 주어지는 searchIcon의 우측 마진 값입니다.
    private static let searchIconDefaultLeftMargin: CGFloat = 6
    
    //  clearButtonDefaultRightMargin: CGFloat
    //  아무 설정을 하지 않았을 때 기본으로 주어지는 clearButton의 우측 마진 값입니다.
    private static let clearButtonDefaultRightMargin: CGFloat = 6
    
    
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
        self.backgroundImage = UIImage()
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0,
                                                                leading: YDSSearchBar.outsideLeftMargin,
                                                                bottom: 0,
                                                                trailing: YDSSearchBar.outsideRightMargin
        )
        
        self.tintColor = YDSColor.textPointed
        
        searchTextField.tintColor = YDSColor.textPointed
        searchTextField.font = YDSFont.body2
        searchTextField.clearButtonMode = .whileEditing
        searchTextField.layer.cornerRadius = Constant.Rounding.r8
        searchTextField.backgroundColor = YDSColor.inputFieldElevated

        self.setPositionAdjustment(UIOffset(horizontal: YDSSearchBar.leftMargin - YDSSearchBar.searchIconDefaultLeftMargin, vertical: 0), for: .search)
        self.setPositionAdjustment(UIOffset(horizontal: -(YDSSearchBar.rightMargin - YDSSearchBar.clearButtonDefaultRightMargin), vertical: 0), for: .clear)

        self.snp.makeConstraints {
            $0.height.equalTo(YDSSearchBar.searchBarHeight)
        }
        
        setState()
    }
    
    //  setState()
    //  필드의 상태를 세팅합니다.
    //  우선순위는 isDisabled > isNegative > isPositive 입니다.
    private func setState() {
        if isDisabled {
            searchTextField.isEnabled = false
            searchTextField.textColor = YDSColor.textDisabled
            searchTextField.leftView?.tintColor = YDSColor.textDisabled
            setPlaceholderTextColor()
            return
        }
        
        searchTextField.isEnabled = true
        searchTextField.textColor = YDSColor.textSecondary
        searchTextField.leftView?.tintColor = YDSColor.textSecondary
        setPlaceholderTextColor()
    }

    //  setPlaceHolder()
    //  isDisabled의 값에 따라 placeholder label의 색이 달라집니다.
    private func setPlaceholderTextColor() {
        let placeholderTextColor: UIColor
        
        if self.isDisabled {
            placeholderTextColor = YDSColor.textDisabled
        } else {
            placeholderTextColor = YDSColor.textTertiary
        }
        
        if let text = placeholder {
            searchTextField.attributedPlaceholder = NSAttributedString(
                string: text,
                attributes: [NSAttributedString.Key.foregroundColor : placeholderTextColor]
            )
        }
    }
    
    

}
