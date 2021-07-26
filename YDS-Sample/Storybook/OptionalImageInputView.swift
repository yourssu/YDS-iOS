//
//  OptionalImageInputView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

class OptionalImageInputView: ItemPickerInputView<UIImage?>, UIPickerViewDelegate {

    var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }
    
    public override init(cases: [UIImage?]) {
        super.init(cases: cases)
        
        pickerView.delegate = self
        
        optionalToggle.addTarget(
            self,
            action: #selector(didToggleValueChanged(_:)),
            for: .valueChanged)
    
        textFieldView.isDisabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
