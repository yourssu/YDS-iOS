//
//  SuffixTextFieldSampleVC.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/19.
//

import UIKit
import YDS_iOS
import SnapKit

class SuffixTextFieldSampleVC: UIViewController, UITextFieldDelegate {
    
    let sampleTextField: YDSSuffixTextField = {
        let textField = YDSSuffixTextField()
        textField.fieldLabelText = "이메일"
        textField.placeholder = "dinohan"
        textField.helperLabelText = "이메일은 40글자 이상 80글자 이하여야 합니다."
        textField.suffixLabelText = "@soongsil.ac.kr"
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
        sampleTextField.base.returnKeyType = .done
        sampleTextField.base.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.base.endEditing(true)
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

