//
//  ColorsListItemCell.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/10.
//

import UIKit
import YDS

class ColorsListItemCell: UITableViewCell {
        
    private enum Dimension {
        enum Padding {
            static let vertical: CGFloat = 16
            static let horizontal: CGFloat = 24
        }
        
        enum Circle {
            static let radius: CGFloat = 24
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
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .fill
        stackView.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return stackView
    }()
    
    private let colorCircleView: UIView = {
        let view = UIView()
        view.snp.makeConstraints {
            $0.height.width.equalTo(Dimension.Circle.radius*2)
        }
        view.layer.cornerRadius = Dimension.Circle.radius
        view.clipsToBounds = true
        view.layer.borderWidth = 1/UIScreen.main.scale
        view.layer.borderColor = YDSColor.borderNormal.cgColor
        return view
    }()
    
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    private let captionLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textTertiary
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
        
        stackView.addArrangedSubviews(colorCircleView, labelStackView)
        labelStackView.addArrangedSubviews(titleLabel, captionLabel)
    }
    
    private func setAutolayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    func fillData(with model: Color) {
        colorCircleView.backgroundColor = model.color
        titleLabel.text = model.name
        captionLabel.text = model.basicColorName
    }
    
}
