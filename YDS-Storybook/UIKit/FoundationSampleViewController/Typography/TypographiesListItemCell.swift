//
//  TypographiesListItemCell.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/09/14.
//

// swiftlint:disable nesting

import UIKit
import YDS

class TypographiesListItemCell: UITableViewCell {

    private enum Dimension {
        enum Padding {
            static let vertical: CGFloat = 16
            static let horizontal: CGFloat = 20
        }

        enum Description {
            enum Padding {
                static let vertical: CGFloat = 8
                static let horizontal: CGFloat = 20
            }
        }
    }

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.alignment = .fill
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: Dimension.Padding.vertical,
                                               left: Dimension.Padding.horizontal,
                                               bottom: Dimension.Padding.vertical,
                                               right: Dimension.Padding.horizontal)
        return stackView
    }()

    private let badge = YDSBadge()

    private let sampleLabel: YDSLabel = {
        let label = YDSLabel(style: .body1)
        label.textColor = YDSColor.textPrimary
        label.numberOfLines = 0
        label.text = """
        계절이 지나가는 하늘에는 가을로 가득 차 있습니다.
        나는 아무 걱정도 없이 가을 속의 별들을 다 헬 듯합니다.
        가슴 속에 하나 둘 새겨지는 별을 이제 다 못 헤는 것은 쉬이 아침이 오는 까닭이요, 내일 밤이 남은 까닭이요, 아직 나의 청춘이 다하지 않은 까닭입니다.
        """
        return label
    }()

    private let descriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill

        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: Dimension.Description.Padding.vertical,
                                               left: Dimension.Description.Padding.horizontal,
                                               bottom: Dimension.Description.Padding.vertical,
                                               right: Dimension.Description.Padding.horizontal)

        stackView.backgroundColor = YDSColor.monoItemBG
        stackView.layer.cornerRadius = 8
        stackView.clipsToBounds = true
        return stackView
    }()

    private let sizeDescriptionRow: TypographiesListItemCellDescriptionRow = {
        let row = TypographiesListItemCellDescriptionRow()
        row.category = "size"
        return row
    }()

    private let weightDescriptionRow: TypographiesListItemCellDescriptionRow = {
        let row = TypographiesListItemCellDescriptionRow()
        row.category = "weight"
        return row
    }()

    private let lineHeightDescriptionRow: TypographiesListItemCellDescriptionRow = {
        let row = TypographiesListItemCellDescriptionRow()
        row.category = "lineHeight"
        return row
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
        self.addSubview(stackView)
        stackView.addArrangedSubviews(badge,
                                      sampleLabel,
                                      descriptionStackView)
        descriptionStackView.addArrangedSubviews(sizeDescriptionRow,
                                                 weightDescriptionRow,
                                                 lineHeightDescriptionRow)
    }

    private func setAutolayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalToSuperview()
        }
    }

    func fillData(with model: String.TypoStyle) {
        badge.text = String(describing: model)
        sampleLabel.style = model
        sizeDescriptionRow.property = String(format: "%.0f", model.font.pointSize) + "pt"
        weightDescriptionRow.property = model.font
                                                .fontDescriptor
                                                .object(forKey: UIFontDescriptor.AttributeName.face) as? String
        lineHeightDescriptionRow.property = String(format: "%.0f", 100*model.lineHeight) + "%"

    }
}

private class TypographiesListItemCellDescriptionRow: UIView {

    var category: String? {
        get { return categoryLabel.text }
        set { categoryLabel.text = newValue }
    }

    var property: String? {
        get { return propertyLabel.text }
        set { propertyLabel.text = newValue }
    }

    private let categoryLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle3)
        label.textColor = YDSColor.textTertiary
        return label
    }()

    private let propertyLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.monoItemText
        return label
    }()

    private enum Dimension {
        static let height: CGFloat = 32
        static let categoryLabelWidth: CGFloat = 100
    }

    init() {
        super.init(frame: .zero)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        self.addSubviews(categoryLabel, propertyLabel)
    }

    private func setAutolayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(Dimension.height)
        }

        categoryLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.width.equalTo(Dimension.categoryLabelWidth)
            $0.top.bottom.equalToSuperview()
        }

        propertyLabel.snp.makeConstraints {
            $0.leading.equalTo(categoryLabel.snp.trailing)
            $0.trailing.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
    }
}
