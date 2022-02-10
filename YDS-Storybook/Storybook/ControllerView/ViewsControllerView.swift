//
//  ViewsControllerView.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/01/24.
//

import UIKit
import YDS
import RxSwift

final class ViewsControllerView: PickerControllerView<[UIView]>, UIPickerViewDelegate {
    
    var names: [String] = ["뷰 1개", "뷰 2개", "뷰 3개", "뷰 4개", "뷰 5개"]

    private var isDisabled: Bool = true {
        didSet {
            optionalToggle.isOn = !isDisabled
            textFieldView.isDisabled = isDisabled
        }
    }
    
    public init(viewsArrs: [[UIView]], defaultViews: [UIView]) {
        
        if let index = viewsArrs.firstIndex(of: defaultViews) {
            super.init(cases: viewsArrs, defaultIndex: index)
        } else {
            super.init(cases: viewsArrs, defaultIndex: 0)
        }
        
        pickerView.delegate = self
        
        optionalToggle.addTarget(
            self,
            action: #selector(didToggleValueChanged(_:)),
            for: .valueChanged)
        
        setInitialState()
        
        optionalToggle.isHidden = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setInitialState() {
        observable
            .take(1)
            .subscribe(onNext: { value in
                if !value.isEmpty {
                    self.isDisabled = false
                    self.textFieldView.text = self.names[self.cases.firstIndex(of: value) ?? 0]
                } else {
                    self.isDisabled = true
                    self.textFieldView.text = self.names[0]
                }
            })
            .disposed(by: bag)
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: YDSToggle) {
        textFieldView.isDisabled = !toggle.isOn
        
        if toggle.isOn {
            let row = pickerView.selectedRow(inComponent: 0)
            observable.onNext(cases[row])
            textFieldView.text = names[row]
        } else {
            observable.onNext([])
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        observable.onNext(cases[row])
        textFieldView.text = names[row]
    }
}
