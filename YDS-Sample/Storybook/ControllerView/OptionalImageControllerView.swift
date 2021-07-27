//
//  OptionalImageControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import RxSwift

class OptionalImageControllerView: PickerControllerView<UIImage?>, UIPickerViewDelegate {

    private var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }
    
    public override init(cases: [UIImage?], defaultValue: UIImage?) {
        super.init(cases: cases, defaultValue: defaultValue)
        
        pickerView.delegate = self
        
        optionalToggle.addTarget(
            self,
            action: #selector(didToggleValueChanged(_:)),
            for: .valueChanged)
    
        setInitialState(value: defaultValue)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState(value: UIImage?) {
        if let value = value, let index = cases.firstIndex(of: value) {
            self.isDisabled = false
            self.pickerView.selectRow(index, inComponent: 0, animated: true)
            self.textFieldView.text = cases[index]?.accessibilityIdentifier
        } else {
            self.isDisabled = true
        }
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