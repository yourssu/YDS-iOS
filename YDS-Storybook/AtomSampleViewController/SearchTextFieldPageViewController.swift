//
//  SearchTextFieldPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/23.
//

import UIKit
import YDS
import SnapKit

class SearchTextFieldPageViewController: StoryBookViewController {
        
    let sampleTextField: YDSSearchTextField = {
        let textField = YDSSearchTextField()
        return textField
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
        self.title = "SearchTextField"
        self.sampleView.backgroundColor = YDSColor.bgNormal
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleTextField)
        
    }
    
    private func setAutolayout() {
        sampleTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func addOptions() {
        addOption(description: "placeholder",
                  defaultValue: "검색어를 입력해주세요.") { [weak self] value in
            self?.sampleTextField.placeholder = value
        }
        
        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleTextField.isDisabled = value
        }
    }
    
    
}

extension SearchTextFieldPageViewController {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.endEditing(true)
    }
}
