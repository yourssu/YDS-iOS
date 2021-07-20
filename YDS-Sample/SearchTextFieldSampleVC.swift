//
//  SearchTextFieldSampleVC.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/20.
//

import UIKit
import SnapKit
import YDS_iOS

class SearchTextFieldSampleVC: UIViewController, UITextFieldDelegate, UISearchBarDelegate {
    
    let sampleTextField: YDSSearchTextField = {
        let sampleTextField = YDSSearchTextField()
        sampleTextField.placeholder = "검색어를 입력해주세요."
        return sampleTextField
    }()
    
    let sampleSearchBar: YDSSearchBar = {
        let searchBar = YDSSearchBar()
        searchBar.placeholder = "검색어를 입력해주세요."
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    private func setUI(){
        self.view.backgroundColor = YDSColor.bgNormal
        
        self.view.addSubview(sampleTextField)
        sampleTextField.snp.makeConstraints {
            $0.width.equalToSuperview().offset(-32)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(24)
        }
        
        _ = sampleTextField.becomeFirstResponder()
        sampleTextField.delegate = self
        sampleTextField.returnKeyType = .done
        sampleTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
        
        self.view.addSubview(sampleSearchBar)
        sampleSearchBar.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.sampleTextField.snp.bottom).offset(24)
        }
        
        _ = sampleSearchBar.becomeFirstResponder()
        sampleSearchBar.delegate = self
        sampleSearchBar.returnKeyType = .done
        sampleSearchBar.searchTextField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sampleTextField.endEditing(true)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        print(text)
        
        if text == "Disabled" {
            sampleTextField.isDisabled = true
            sampleSearchBar.isDisabled = true
        }
    }

}
