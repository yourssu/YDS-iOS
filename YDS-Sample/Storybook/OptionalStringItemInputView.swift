//
//  OptionalStringItemInputView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

class OptionalStringInputView: ItemInputView<String?> {
    
    var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }

    public override init() {
        super.init()
        
        optionalToggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .valueChanged)
        
        textFieldView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        textFieldView.isDisabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        observable.onNext(textField.text)
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: Toggle) {
        textFieldView.isDisabled = !toggle.isOn
        
        if toggle.isOn {
            observable.onNext(textFieldView.text)
        } else {
            observable.onNext(nil)
        }
    }
    
}
