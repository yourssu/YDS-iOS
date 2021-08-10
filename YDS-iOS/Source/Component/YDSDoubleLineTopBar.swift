//
//  YDSDoubleLineTopBar.swift
//  YDS-iOS
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit

public class YDSDoubleLineTopBar: UINavigationBar {
    
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
        let label = YDSLabel(style: .title3)
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    private let subtitleLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        return label
    }()
    
    private enum Dimension {
        static let height = 72
        
        enum Spacing {
            static let vertical = 3
            static let horizontal = 16
        }
        
        enum Padding {
            static let leading = 16
            static let trailing = 6
            static let bottom = 10
        }
    }
    
//    public let button1: YDSPlainButton = {
//        let button = YDSPlainButton()
//        button.size = .large
//        button.leftIcon = YDSIcon.plusLine
//        return button
//    }()
//
//    let button2: YDSPlainButton = {
//        let button = YDSPlainButton()
//        button.size = .large
//        button.leftIcon = YDSIcon.listLine
//        return button
//    }()
//
//    let button3: YDSPlainButton = {
//        let button = YDSPlainButton()
//        button.size = .large
//        button.leftIcon = YDSIcon.dotsVerticalLine
//        return button
//    }()
//
//    let buttonStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        return stackView
//    }()

    public init() {
        super.init(frame: .zero)
        setupView()
        
        let item1 = UIBarButtonItem(image: YDSIcon.groundLine, style: .plain, target: self, action: nil)
        self.topItem?.setRightBarButton(item1, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        setProperties()
        setLayouts()
    }
    
    private func setProperties() {
        self.backgroundColor = YDSColor.bgElevated
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        [titleLabel, subtitleLabel].forEach {
            self.addSubview($0)
        }
        
//        [button1, button2, button3].forEach {
//            buttonStackView.addArrangedSubview($0)
//        }
    }
    
    private func setAutolayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(Dimension.height)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Dimension.Padding.leading)
//            $0.trailing.equalTo(buttonStackView.snp.leading).offset(-Dimension.Spacing.horizontal)
            $0.bottom.equalToSuperview().offset(-Dimension.Padding.bottom)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(Dimension.Padding.leading)
//            $0.trailing.equalTo(buttonStackView.snp.leading).offset(-Dimension.Spacing.horizontal)
            $0.bottom.equalTo(titleLabel.snp.top).offset(-Dimension.Spacing.vertical)
        }
        
//        buttonStackView.snp.makeConstraints {
//            $0.bottom.equalToSuperview()
//            $0.trailing.equalToSuperview().offset(-Dimension.Padding.trailing)
//        }
        
//        [button1, button2, button3].forEach {
//            $0.snp.makeConstraints {
//                $0.width.equalTo(44)
//                $0.height.equalTo(52)
//            }
//        }
    }
    
}
