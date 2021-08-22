//
//  ViewController.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit
import YDS
import SnapKit

class SimpleTextFieldSampleViewController: UIViewController, UITextFieldDelegate {
    
    let sampleTextField: YDSSimpleTextFieldView = {
        let textField = YDSSimpleTextFieldView()
        textField.fieldLabelText = "닉네임"
        textField.placeholder = "John Doe"
        textField.helperLabelText = "이상한거 쓰지 마세요."
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
        
        _ = sampleTextField.textField.becomeFirstResponder()
        sampleTextField.textField.delegate = self
        sampleTextField.textField.returnKeyType = .done
        sampleTextField.textField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.textField.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }

        if text == "Disabled" {
            sampleTextField.isDisabled = !sampleTextField.isDisabled
            return
        }
        
        if text == "Negative" {
            sampleTextField.isNegative = !sampleTextField.isNegative
            return
        }
        
        if text == "Positive" {
            sampleTextField.isPositive = !sampleTextField.isPositive
            return
        }
    }
}
