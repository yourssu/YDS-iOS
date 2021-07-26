//
//  BoolInputView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS

class BoolInputView: ItemInputView<Bool> {

    private let toggle = Toggle()

    public override init() {
        super.init()
        
        self.textFieldView.isHidden = true
        
        toggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .valueChanged)
        stackView.addArrangedSubview(toggle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: Toggle) {
        observable.onNext(toggle.isOn)
    }

}
