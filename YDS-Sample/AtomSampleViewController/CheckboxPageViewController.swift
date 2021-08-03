//
//  CheckboxPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/03.
//

import UIKit
import YDS_iOS
import SnapKit

class CheckboxPageViewController: StoryBookViewController {
        
    let sampleCheckbox: YDSCheckbox = {
        let checkbox = YDSCheckbox()
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
    }
    
    private func setViewProperty() {
        self.title = "Checkbox"
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleCheckbox)
        
    }
    
    private func setAutolayout() {
        sampleCheckbox.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
//            $0.center.equalToSuperview()
        }
    }
    
    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "체크") { [weak self] value in
            self?.sampleCheckbox.text = value
        }
        
        addOption(description: "size",
                  cases: YDSCheckbox.CheckboxSize.allCases,
                  defaultIndex: 1) { [weak self] value in
            self?.sampleCheckbox.size = value
        }
    
        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleCheckbox.isDisabled = value
        }
        

    }

}

extension YDSCheckbox.CheckboxSize: CaseIterable {
    public static var allCases: [YDSCheckbox.CheckboxSize] = [.large, .medium, .small]
}
