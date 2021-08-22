//
//  SuffixTextFieldViewPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/23.
//

import UIKit
import YDS
import SnapKit

class SuffixTextFieldViewPageViewController: StoryBookViewController {
        
    let sampleTextFieldView: YDSSuffixTextFieldView = {
        let textFieldView = YDSSuffixTextFieldView()
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
        self.title = "SuffixTextFieldView"
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
                  defaultValue: "학교 이메일") { [weak self] value in
            self?.sampleTextFieldView.fieldLabelText = value
        }
        
        addOption(description: "placeholder",
                  defaultValue: "아이디") { [weak self] value in
            self?.sampleTextFieldView.placeholder = value
        }
        
        addOption(description: "suffixLabelText",
                  defaultValue: "@soongsil.ac.kr") { [weak self] value in
            self?.sampleTextFieldView.suffixLabelText = value
        }
        
        addOption(description: "helperLabelText",
                  defaultValue: "이메일의 규칙은 어떠어떠합니다.") { [weak self] value in
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

extension SimpleTextFieldViewPageViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextFieldView.textField.endEditing(true)
    }
}
