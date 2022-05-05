//
//  YDSListToggleItem.swift
//  YDS
//
//  Created by Yonghyun on 2022/05/02.
//

import UIKit

public class YDSListToggleItem: UIView {

    // MARK: - 뷰
    
    /// ListToggleItem의 title을 보여주는 label
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.textAlignment = .left
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    /// ListToggleItem의 Toggle
    public let toggle: YDSToggle = {
        let toggle = YDSToggle()
        return toggle
    }()
    
    public init(title: String) {
        super.init(frame: .zero)
        setupView()
        titleLabel.text = title
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 뷰를 세팅합니다.
    private func setupView() {
        setLayouts()
    }
    
    /// 레이아웃을 세팅합니다.
    private func setLayouts() {
        setViewHierarchy()
        setConstraints()
    }
    
    /// 뷰의 위계를 세팅합니다.
    private func setViewHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(toggle)
    }
    
    /// 뷰의 오토레이아웃을 세팅합니다.
    private func setConstraints() {
        self.snp.makeConstraints {
            $0.height.equalTo(48)
        }

        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(Dimension.Padding.vertical)
            $0.leading.trailing.equalToSuperview().inset(Dimension.Padding.horizontal)
        }

        toggle.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Dimension.Padding.horizontal)
        }
    }
    
    //  MARK: - 외부에서 접근할 수 없는 enum
    
    private enum Dimension {
        enum Padding {
            static let horizontal: CGFloat = 20
            static let vertical: CGFloat = 12.5
        }
        
        enum Toggle {
            static let verticalPadding: CGFloat = 8.5
        }
    }
}
