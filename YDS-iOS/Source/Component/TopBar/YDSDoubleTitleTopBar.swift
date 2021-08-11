//
//  YDSDoubleTitleTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit

public class YDSDoubleTitleTopBar: YDSTopBar {
    
    public var title: String? {
        get {
            return self.titleLabel.text
        }
        set(inputValue) {
            self.titleLabel.text = inputValue
        }
    }
    
    public var subtitle: String? {
        get {
            return self.subtitleLabel.text
        }
        set(inputValue) {
            self.subtitleLabel.text = inputValue
        }
    }
    
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .title2)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    private let subtitleLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Dimension.LabelStackView.spacing
        return stackView
    }()
    
    private enum Dimension {
        static let height: CGFloat = 72
        
        enum LabelStackView {
            enum Margin {
                static let bottom: CGFloat = 8
            }
            static let spacing: CGFloat = 2
        }
        
        enum RightBarButton {
            static let height: CGFloat = 52
        }

    }
    
    public init(title: String?, subtitle: String?) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
        setLayouts()
    }
    
    private func setProperties() {
        self.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.clear,
        ]
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        [subtitleLabel, titleLabel].forEach {
            labelStackView.addArrangedSubview($0)
        }
        
        self.topItem?.setLeftBarButton(UIBarButtonItem(customView: labelStackView),
                                       animated: true)
    }
    
    private func setAutolayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(Dimension.height)
        }
    }
}


extension YDSDoubleTitleTopBar {
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        setHeight()
        removeButtonBarConstraints()
        setButtonBarConstraints()
    }
    
    private func setHeight() {
        [self, contentView, backgroundView].forEach {
            $0?.frame.size.height = Dimension.height
        }
    }
    
    private func removeButtonBarConstraints() {
        contentView?.layoutGuides
            .filter { $0.description.contains("BarGuide")}
            .forEach {
                $0.constraintsAffectingLayout(for: .vertical)
                    .forEach {
                        if $0.description.contains("height") {
                            if $0.description.contains("LeadingBarGuide") {
                                $0.isActive = false
                            }
                            
                            if $0.description.contains("TrailingBarGuide") {
                                $0.constant = Dimension.RightBarButton.height
                            }
                        }
                        
                        if $0.description.contains("BarGuide") && ($0.firstAttribute == .top) {
                            $0.isActive = false
                        }
                    }
            }
    }
    
    private func setButtonBarConstraints() {
        leftButtonBar?.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-Dimension.LabelStackView.Margin.bottom)
        }
        
        rightButtonBar?.snp.makeConstraints {
            $0.bottom.equalToSuperview()
        }
    }
    
}
