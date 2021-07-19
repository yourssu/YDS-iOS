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
        textField.fieldLabelText = "비밀번호"
        textField.placeHolderText = "1q2w3e4r!@"
        textField.helperLabelText = "숫자와 영문자 조합으로 8자 이상 입력해주세요."
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
        
        if text.count < 8 {
            self.sampleTextField.isNegative = false
            self.sampleTextField.isPositive = false
            return
        }
        
        self.sampleTextField.isPositive = isFulfilled
        self.sampleTextField.isNegative = !isFulfilled
    }
}
