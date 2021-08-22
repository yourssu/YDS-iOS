//
//  PasswordTextFieldViewPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/23.
//

import UIKit
import YDS
import SnapKit

class PasswordTextFieldViewPageViewController: StoryBookViewController {
        
    let sampleTextFieldView: YDSPasswordTextFieldView = {
        let textFieldView = YDSPasswordTextFieldView()
        return textFieldView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addOptions()
    }
    
    private func setupView() {
        setViewProperty()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperty() {
        self.title = "PasswordTextFieldView"
        self.sampleView.backgroundColor = YDSColor.bgNormal
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleTextFieldView)
        
    }
    
    private func setAutolayout() {
        sampleTextFieldView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func addOptions() {
        addOption(description: "fieldLabelText",
                  defaultValue: "비밀번호") { [weak self] value in
            self?.sampleTextFieldView.fieldLabelText = value
        }
        
        addOption(description: "placeholder",
                  defaultValue: "1q2w3e4r!") { [weak self] value in
            self?.sampleTextFieldView.placeholder = value
        }
        
        addOption(description: "helperLabelText",
                  defaultValue: "숫자와 영문자 조합으로 8자 이상 입력해 주세요.") { [weak self] value in
            self?.sampleTextFieldView.helperLabelText = value
        }
        
        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleTextFieldView.isDisabled = value
        }
        
        addOption(description: "isNegative",
                  defaultValue: false) { [weak self] value in
            self?.sampleTextFieldView.isNegative = value
        }
        
        addOption(description: "isPositive",
                  defaultValue: false) { [weak self] value in
            self?.sampleTextFieldView.isPositive = value
        }
    }
    
    
}

extension PasswordTextFieldViewPageViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextFieldView.textField.endEditing(true)
    }
}
