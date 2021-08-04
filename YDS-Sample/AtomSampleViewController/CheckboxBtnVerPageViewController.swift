//
//  CheckboxBtnVerPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/04.
//

import UIKit
import YDS_iOS
import SnapKit

class CheckboxBtnVerPageViewController: StoryBookViewController {
        
    let sampleCheckbox: YDSCheckboxBtnVer = {
        let checkbox = YDSCheckboxBtnVer()
        return checkbox
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addOptions()
    }
    
    private func setupView() {
        setViewProperty()
        setViewHierarchy()
        setAutolayout()
        
        sampleCheckbox.addTarget(self, action: #selector(printIsSelected(_:)), for: .touchUpInside)
    }
    
    @objc
    private func printIsSelected(_ sender: UIControl) {
        print(sampleCheckbox.isSelected)
    }
    
    private func setViewProperty() {
        self.title = "CheckboxBtnVer"
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleCheckbox)
        
    }
    
    private func setAutolayout() {
        sampleCheckbox.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "체크") { [weak self] value in
            self?.sampleCheckbox.text = value
        }
        
        addOption(description: "size",
                  cases: YDSCheckboxBtnVer.CheckboxSize.allCases,
                  defaultIndex: 1) { [weak self] value in
            self?.sampleCheckbox.size = value
        }
    
        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleCheckbox.isDisabled = value
        }
        

    }

}

extension YDSCheckboxBtnVer.CheckboxSize: CaseIterable {
    public static var allCases: [YDSCheckboxBtnVer.CheckboxSize] = [.large, .medium, .small]
}
