//
//  IconsListItemCell.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/03/13.
//

import UIKit
import YDS

class IconsListItemCell: UITableViewCell {
        
    private enum Dimension {
        enum Padding {
            static let vertical: CGFloat = 16
            static let horizontal: CGFloat = 24
        }
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: Dimension.Padding.vertical,
                                               left: Dimension.Padding.horizontal,
                                               bottom: Dimension.Padding.vertical,
                                               right: Dimension.Padding.horizontal)
        return stackView
    }()
    
    private let iconView: YDSIconView = {
        let icon = YDSIconView()
        icon.tintColor = YDSColor.textSecondary
        icon.size = .medium
        return icon
    }()
    
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperties() {
        self.selectionStyle = .none
    }
    
    private func setViewHierarchy() {
        self.contentView.addSubview(stackView)
        
        stackView.addArrangedSubviews(iconView, titleLabel)
    }
    
    private func setAutolayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func fillData(with model: UIImage) {
        titleLabel.text = model.accessibilityIdentifier
        iconView.image = model.withRenderingMode(.alwaysTemplate)
    }
}
