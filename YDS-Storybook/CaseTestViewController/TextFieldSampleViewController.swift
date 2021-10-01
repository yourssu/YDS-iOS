//
//  TextFieldSampleCaseAViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/02.
//

import UIKit
import RxSwift
import YDS

class TextFieldSampleViewController: UIViewController {
    
    //  MARK: - ViewModel
    private let viewModel = TextFieldSampleViewModel()
    private let bag = DisposeBag()
    
    //  MARK: - Dimension
    private enum Dimension {
        enum Margin {
            static let vertical = 24
            static let horizontal = 20
        }
    }
    
    //  MARK: - View
    private let titleLabel: YDSLabel = {
        let label = YDSLabel(style: .subtitle1)
        label.textColor = YDSColor.textPrimary
        label.numberOfLines = 0
        label.text = "사용할 닉네임을 입력해 주세요."
        return label
    }()
    
    private let nicknameTextField: YDSSimpleTextFieldView = {
        let textFieldView = YDSSimpleTextFieldView()
        textFieldView.fieldLabelText = nil
        textFieldView.helperLabelText = "한글, 영어, 숫자를 사용해 2~12자로 입력해 주세요."
        return textFieldView
    }()
    
    private let confirmButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.text = "다음"
        button.size = .large
        button.rounding = .r8
        return button
    }()

    //  MARK: - Func
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    private func setupViews() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
        bindViewModel()
    }
    
    private func setViewProperties() {
        title = "회원가입"
        view.backgroundColor = YDSColor.bgNormal
        nicknameTextField.textField.becomeFirstResponder()
        nicknameTextField.textField.addTarget(self,
                                              action: #selector(textFieldEditingChanged(_:)),
                                              for: .editingChanged)
        
        confirmButton.addTarget(self,
                                action: #selector(confirmButtonDidTap(_:)),
                                for: .touchUpInside)
    }
    
    private func setViewHierarchy() {
        view.addSubviews(titleLabel, nicknameTextField, confirmButton)
    }
    
    private func setAutolayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.vertical)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.horizontal)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.horizontal)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(48)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.horizontal)
        }
    }
    
    private func bindViewModel() {
        viewModel.confirmButtonIsDisabled
            .subscribe(onNext: { [weak self] value in
                self?.confirmButton.isDisabled = value
            })
            .disposed(by: bag)
        
        viewModel.textFieldIsPositive
            .subscribe(onNext: { [weak self] value in
                self?.nicknameTextField.isPositive = value
            })
            .disposed(by: bag)
        
        viewModel.textFieldIsNegative
            .subscribe(onNext: { [weak self] value in
                self?.nicknameTextField.isNegative = value
            })
            .disposed(by: bag)
        
        viewModel.textFieldShoudShake
            .subscribe(onNext: { [weak self] value in
                if value {
                    self?.nicknameTextField.shake(withHaptic: false)
                }
            })
            .disposed(by: bag)
        
        viewModel.textFieldShoudShakeWithHaptic
            .subscribe(onNext: { [weak self] value in
                if value {
                    self?.nicknameTextField.shake(withHaptic: true)
                }
            })
            .disposed(by: bag)
        
        viewModel.shouldShowToastMessage
            .subscribe(onNext: { [weak self] value in
                if value {
                    YDSToast.makeToast(text: "중복 닉네임입니다.")
                    self?.nicknameTextField.textField.resignFirstResponder()
                }
            })
            .disposed(by: bag)
    }

}

//  MARK: - Extension
extension TextFieldSampleViewController {
    @objc
    private func textFieldEditingChanged(_ textField: UITextField) {
        viewModel.textFieldEditingChanged(text: textField.text)
    }
    
    @objc
    private func confirmButtonDidTap(_ sender: UIControl) {
        viewModel.confirmButtonDidTap()
    }
}
