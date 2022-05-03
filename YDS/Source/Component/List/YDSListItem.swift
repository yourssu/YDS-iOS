//
//  YDSListItem.swift
//  YDS
//
//  Created by Yonghyun on 2022/05/02.
//

import UIKit

public class YDSListItem: UIView, YDSListProtocol {
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.textColor = YDSColor.textSecondary
        label.textAlignment = .left
        return label
    }()
    
    private let nextIconView: YDSIconView = {
        let icon = YDSIconView()
        icon.tintColor = YDSColor.buttonNormal
        icon.size = .medium
        icon.image = YDSIcon.arrowRightLine
        return icon
    }()
    
    public var showNextIconView: Bool? {
        didSet {
            setNeedsLayout()
        }
    }
    
    public var button: UIButton = {
        let button = UIButton()
        return button
    }()

    public init(title: String, showNextIconView: Bool? = nil) {
        super.init(frame: .zero)
        setupView()
        titleLabel.text = title
        self.showNextIconView = showNextIconView
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
        self.addSubview(nextIconView)
        self.addSubview(button)
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

        nextIconView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(Dimension.Padding.horizontal)
        }
        
        button.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        nextIconView.isHidden = !(showNextIconView ?? false)
    }
    
    public func setWidth() {
        self.snp.makeConstraints {
            $0.width.equalToSuperview()
        }
    }
    
    //  MARK: - 외부에서 접근할 수 없는 enum
    
    private enum Dimension {
        enum Padding {
            static let horizontal: CGFloat = 20
            static let vertical: CGFloat = 12.5
        }
    }
}
