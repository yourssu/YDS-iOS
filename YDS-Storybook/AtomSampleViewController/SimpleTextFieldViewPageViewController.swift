//
//  SimpleTextFieldViewPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/23.
//

import UIKit
import YDS
import SnapKit

class SimpleTextFieldViewPageViewController: StoryBookViewController {

    let sampleTextFieldView: YDSSimpleTextFieldView = {
        let textFieldView = YDSSimpleTextFieldView()
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
        self.title = "SimpleTextFieldView"
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
                  defaultValue: "닉네임") { [weak self] value in
            self?.sampleTextFieldView.fieldLabelText = value
        }

        addOption(description: "placeholder",
                  defaultValue: "홍길동") { [weak self] value in
            self?.sampleTextFieldView.placeholder = value
        }

        addOption(description: "helperLabelText",
                  defaultValue: "닉네임은 20글자 이하로 해주세요.") { [weak self] value in
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

extension SuffixTextFieldViewPageViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextFieldView.textField.endEditing(true)
    }
}
