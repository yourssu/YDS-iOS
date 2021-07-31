//
//  OptionalImageControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

final class OptionalImageControllerView: PickerControllerView<UIImage?>, UIPickerViewDelegate {

    private var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }
    
    public init(images: [UIImage?], defaultIndex: Int?) {
        
        if let index = defaultIndex {
            super.init(cases: images, defaultIndex: index)
        } else {
            super.init(cases: images, defaultIndex: 0)
        }
        
        pickerView.delegate = self
        
        optionalToggle.addTarget(
            self,
            action: #selector(didToggleValueChanged(_:)),
            for: .valueChanged)
        
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
                    self.textFieldView.text = value?.accessibilityIdentifier
                } else {
                    self.isDisabled = true
                    self.textFieldView.text = self.cases[0]?.accessibilityIdentifier
                }
            })
            .disposed(by: bag)
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: Toggle) {
        textFieldView.isDisabled = !toggle.isOn
        
        if toggle.isOn {
            let row = pickerView.selectedRow(inComponent: 0)
            observable.onNext(cases[row])
            textFieldView.text = cases[row]?.accessibilityIdentifier
        } else {
            observable.onNext(nil)
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cases[row]?.accessibilityIdentifier
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        observable.onNext(cases[row])
        textFieldView.text = cases[row]?.accessibilityIdentifier
    }
    
}
