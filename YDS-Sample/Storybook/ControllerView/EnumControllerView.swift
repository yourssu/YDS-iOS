//
//  EnumControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit

class EnumControllerView<T>: PickerControllerView<T>, UIPickerViewDelegate {

    public override init(cases: [T], defaultIndex: Int) {
        
        super.init(cases: cases, defaultIndex: defaultIndex)
        
        pickerView.delegate = self
        
        setInitialState(index: defaultIndex)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState(index: Int) {
        self.textFieldView.text = String(describing: cases[index])
    }
    

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(describing: cases[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        observable.onNext(cases[row])
        textFieldView.text = String(describing: cases[row])
    }

}
