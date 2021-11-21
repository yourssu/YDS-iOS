//
//  IntControllerView.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2021/11/21.
//

import UIKit

final class IntControllerView: ControllerView<Int> {

    public override init() {
        super.init()
        
        textFieldView.textField.addTarget(
            self,
            action: #selector(textFieldDidChange(_:)),
            for: .editingChanged
        )
        
        textFieldView.textField.keyboardType = .numberPad
        
        setInitialState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState() {
        observable
            .take(1)
            .subscribe(onNext: { value in
                self.textFieldView.text = String(describing: value)
            })
            .disposed(by: bag)
    }
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text,
           let number = Int(text) {
            observable.onNext(number)
        }
    }
    
}
