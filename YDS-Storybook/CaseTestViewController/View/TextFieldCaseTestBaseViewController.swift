//
//  TextFieldCaseTestBaseViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/10/02.
//

import UIKit
import RxSwift
import YDS

class TextFieldCaseTestBaseViewController: UIViewController {
    
    //  MARK: - ViewModel
    var viewModel: TextFieldCaseTestViewModel?
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
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.vertical)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(Dimension.Margin.horizontal)
        }
    }
    
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
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
                .filter { $0 }
                .subscribe(onNext: { [weak self] _ in
                    self?.nicknameTextField.shake(withHaptic: false)
                })
                .disposed(by: bag)
            
            viewModel.textFieldShoudShakeWithHaptic
                .filter { $0 }
                .subscribe(onNext: { [weak self] _ in
                    self?.nicknameTextField.shake(withHaptic: true)
                })
                .disposed(by: bag)
            
            viewModel.shouldShowToastMessage
                .filter { $0 }
                .subscribe(onNext: { _ in
                    YDSToast.makeToast(text: "중복 닉네임입니다.", duration: .short)
                })
                .disposed(by: bag)
        
    }

}

//  MARK: - Action
extension TextFieldCaseTestBaseViewController {
    @objc
    private func textFieldEditingChanged(_ textField: UITextField) {
        if let viewModel = viewModel {
            viewModel.textFieldEditingChanged(text: textField.text)
        }
    }
    
    @objc
    private func confirmButtonDidTap(_ sender: UIControl) {
        if let viewModel = viewModel {
            viewModel.confirmButtonDidTap()
        }
    }
}

//  MARK: - TextField Keyboard
extension TextFieldCaseTestBaseViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}
