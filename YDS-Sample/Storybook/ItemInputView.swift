//
//  ItemInputView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//


import UIKit
import SnapKit
import YDS_iOS
import RxSwift

class ItemInputView<T>: UIView {
    
    public var observable = PublishSubject<T>()
    let bag = DisposeBag()
        
    // MARK: - 뷰
    
    public let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 12
        return stackView
    }()
    
    private let topAreaStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 8
        return stackView
    }()
    
    private let labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    public let parameterLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle2)
        label.text = "Parameter"
        label.textColor = YDSColor.textPrimary
        return label
    }()
    
    public let typeLabel: YDSLabel = {
        let label = YDSLabel(style: .body2)
        label.textColor = YDSColor.textSecondary
        label.text = String(describing: T.self)
        return label
    }()
    
    public let optionalToggle: Toggle = {
        let toggle = Toggle()
        toggle.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return toggle
    }()
    
    public let textFieldView: YDSSimpleTextFieldView = {
        let textFieldView = YDSSimpleTextFieldView()
        textFieldView.textField.autocorrectionType = .no
        return textFieldView
    }()
    
    private let divider = YDSDivider()
        
    
    // MARK: - 함수
    
    public init() {
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func isOptional(_ type: Any.Type) -> Bool {
        return String(describing: type).hasPrefix("Optional<")
    }
    
    private func setupView() {
        setToggleState()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setToggleState() {
        optionalToggle.isHidden = !isOptional(T.self)
    }
    
    private func setViewHierarchy() {
        self.addSubview(stackView)
        
        stackView.addArrangedSubview(topAreaStackView)
        stackView.addArrangedSubview(textFieldView)
        
        topAreaStackView.addArrangedSubview(labelStackView)
        topAreaStackView.addArrangedSubview(optionalToggle)
        
        labelStackView.addArrangedSubview(parameterLabel)
        labelStackView.addArrangedSubview(typeLabel)
        
        self.addSubview(divider)
    }
    
    private func setAutolayout() {
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        divider.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(24)
            $0.bottom.trailing.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
        }

    }

}

