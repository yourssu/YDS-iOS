//
//  BoolControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS

final class BoolControllerView: ControllerView<Bool> {

    private let toggle = Toggle()

    public override init() {
        super.init()
        
        self.textFieldView.isHidden = true
        
        toggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .valueChanged)
        stackView.addArrangedSubview(toggle)
        
        setInitialState()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState() {
        observable
            .take(1)
            .subscribe { self.toggle.isOn = $0 }
            .disposed(by: bag)
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: Toggle) {
        observable.onNext(toggle.isOn)
    }

}
