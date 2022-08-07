//
//  PickerControllerView.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS

class PickerControllerView<T>: ControllerView<T>, UIPickerViewDataSource {

    public var cases: [T]
    
    public let pickerView = UIPickerView()
    
    private lazy var pickerViewToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width:UIScreen.main.bounds.width, height:44))
        let selectButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissPickerView(_:)))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spacer, selectButton], animated: true)
        toolbar.tintColor = YDSColor.buttonPoint
        return toolbar
    }()
    
    public init(cases: [T], defaultIndex: Int) {
        self.cases = cases
        
        let index = cases.count > defaultIndex
            ? defaultIndex
            : 0
        
        super.init()
        
        textFieldView.textField.inputView = pickerView
        textFieldView.textField.tintColor = .clear
        textFieldView.textField.clearButtonMode = .never
        textFieldView.textField.inputAccessoryView = pickerViewToolbar

        pickerView.dataSource = self
        pickerView.selectRow(index, inComponent: 0, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cases.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    @objc func dismissPickerView(_ toolbar: UIToolbar) {
        textFieldView.textField.resignFirstResponder()
    }

}
