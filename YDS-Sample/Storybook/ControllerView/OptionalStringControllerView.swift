//
//  OptionalStringControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

class OptionalStringControllerView: ControllerView<String?> {
    
    private var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }

    public override init(defaultValue: String?) {
        super.init(defaultValue: defaultValue)
        
        optionalToggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .valueChanged)
        textFieldView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        setInitialState(value: defaultValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState(value: String?) {
        if let value = value {
            self.isDisabled = false
            textFieldView.text = value
        } else {
            self.isDisabled = true
        }
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
