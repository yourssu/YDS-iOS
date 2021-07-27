//
//  BoolControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS

class BoolControllerView: ControllerView<Bool> {

    private let toggle = Toggle()

    public override init(defaultValue: Bool) {
        super.init(defaultValue: defaultValue)
        
        self.textFieldView.isHidden = true
        
        toggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .valueChanged)
        stackView.addArrangedSubview(toggle)
        
        setInitialState(value: defaultValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState(value: Bool) {
        toggle.isOn = value
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: Toggle) {
        observable.onNext(toggle.isOn)
    }

}
