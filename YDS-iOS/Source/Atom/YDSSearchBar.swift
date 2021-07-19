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
    
    //  searchBarHeight: CGFloat
    //  필드 높이입니다.
    private static let searchBarHeight: CGFloat = 44
    
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
            return searchTextField.leftViewRect(forBounds: bounds).width
        }
    }
    
    //  clearButtonWidth: CGFloat
    //  clearButton의 너비입니다.
    private var clearButtonWidth: CGFloat {
        get {
            return searchTextField.clearButtonRect(forBounds: bounds).width
        }
    }
    
    
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
        
        searchTextField.font = YDSFont.body2
        searchTextField.textColor = YDSColor.textSecondary
        searchTextField.tintColor = YDSColor.textPointed
        searchTextField.clearButtonMode = .whileEditing
        
        searchTextField.layer.cornerRadius = Constant.Rounding.r8
        
        searchTextField.backgroundColor = YDSColor.inputFieldElevated
        
        self.setPositionAdjustment(UIOffset(horizontal: YDSSearchBar.leftMargin - YDSSearchBar.searchIconDefaultLeftMargin, vertical: 0), for: .search)
        self.setPositionAdjustment(UIOffset(horizontal: -(YDSSearchBar.rightMargin - YDSSearchBar.clearButtonDefaultRightMargin), vertical: 0), for: .clear)
        self.searchTextPositionAdjustment = UIOffset(horizontal: 4, vertical: 0)
        
        searchTextField.snp.makeConstraints {
            $0.height.equalTo(YDSSearchBar.textFieldHeight)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview()
            $0.width.equalToSuperview().offset(-32)
        }
        
        self.snp.makeConstraints {
            $0.height.equalTo(44)
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
            return
        }
        
        searchTextField.isEnabled = true
        searchTextField.textColor = YDSColor.textSecondary
    }

}
