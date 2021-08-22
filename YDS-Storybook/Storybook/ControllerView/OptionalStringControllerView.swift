//
//  OptionalStringControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS
import RxSwift

final class OptionalStringControllerView: ControllerView<String?> {
    
    private var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }

    public override init() {
        super.init()
        
        optionalToggle.addTarget(
            self,
            action: #selector(didToggleValueChanged(_:)),
            for: .valueChanged
        )
        
        textFieldView.textField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged
        )
        
        setInitialState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState() {
        observable
            .take(1)
            .subscribe(onNext: { value in
                if value != nil {
                    self.isDisabled = false
                    self.textFieldView.text = value
                } else {
                    self.isDisabled = true
                }
            })
            .disposed(by: bag)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        observable.onNext(textField.text)
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: YDSToggle) {
        textFieldView.isDisabled = !toggle.isOn
        
        if toggle.isOn {
            observable.onNext(textFieldView.text)
        } else {
            observable.onNext(nil)
        }
    }
    
}
