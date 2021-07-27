//
//  EnumControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit

class EnumControllerView<T>: PickerControllerView<T>, UIPickerViewDelegate {

    public override init(cases: [T], defaultValue: T) {
        super.init(cases: cases, defaultValue: defaultValue)
        
        pickerView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: cases[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        observable.onNext(cases[row])
        textFieldView.text = String(describing: cases[row])
    }

}