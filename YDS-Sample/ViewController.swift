//
//  ViewController.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit
import YDS_iOS
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    let textField: YDSSimpleTextField = {
        let textField = YDSSimpleTextField()
        textField.placeHolderText = "플레이스홀더"
        textField.fieldLabelText = "필드라벨"
        textField.helperLabelText = "헬퍼라벨"
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
        
        self.view.addSubview(textField)
        textField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        
        textField.becomeFirstResponder()
        textField.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            textField.endEditing(true)
        }
}
