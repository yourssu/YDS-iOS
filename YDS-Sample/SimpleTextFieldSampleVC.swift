//
//  ViewController.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit
import YDS_iOS
import SnapKit

class SimpleTextFieldSampleVC: UIViewController, UITextFieldDelegate {
    
    let sampleTextField: YDSSimpleTextField = {
        let textField = YDSSimpleTextField()
        textField.fieldLabelText = "닉네임"
        textField.placeHolderText = "Dino Han"
        textField.helperLabelText = "닉네임은 4글자 이상 20글자 이하여야 합니다."
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
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        _ = sampleTextField.becomeFirstResponder()
        sampleTextField.delegate = self
        sampleTextField.inputArea.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print(textField.text as Any)
        switch(textField.text) {
        case "Disabled":
            self.sampleTextField.isDisabled = !self.sampleTextField.isDisabled
        case "Negative":
            self.sampleTextField.isNegative = !self.sampleTextField.isNegative
        case "Positive":
            self.sampleTextField.isPositive = !self.sampleTextField.isPositive
        case .none:
            break
        case .some(_):
            break
        }
    }
}
