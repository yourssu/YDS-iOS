//
//  PasswordTextFieldSampleVC.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit
import YDS_iOS
import SnapKit

class PasswordTextFieldSampleViewController: UIViewController, UITextFieldDelegate {

    let sampleTextField: YDSPasswordTextField = {
        let textField = YDSPasswordTextField()
        textField.fieldLabelText = "비밀번호"
        textField.placeholder = "password1234!"
        textField.helperLabelText = "알파벳과 숫자를 포함해서 8자 이상으로 입력해 주세요."
        textField.isMasked = true
        textField.isDisabled = false
        textField.isNegative = false
        textField.isPositive = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI(){
        self.view.backgroundColor = YDSColor.bgNormal
        self.view.addSubview(sampleTextField)
        sampleTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        _ = sampleTextField.base.becomeFirstResponder()
        sampleTextField.base.delegate = self
        sampleTextField.base.keyboardType = .alphabet
        sampleTextField.base.returnKeyType = .done
        sampleTextField.base.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.base.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }

        let passwordRegex: String = #"^(?=.*[A-Za-z])(?=.*\d)[!-~₩]{8,100}$"#
        let isFulfilled = NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: text)
        
        if text == "Disabled" {
            self.sampleTextField.isDisabled = true
            return
        } else {
            self.sampleTextField.isDisabled = false
        }
        
        if text.count < 8 {
            self.sampleTextField.isNegative = false
            self.sampleTextField.isPositive = false
            return
        }
        
        self.sampleTextField.isPositive = isFulfilled
        self.sampleTextField.isNegative = !isFulfilled
    }
    
}
