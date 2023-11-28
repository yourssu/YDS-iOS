//
//  ChipPageViewController.swift
//  YDS-Storybook
//
//  Created by 신종원 on 2023/10/31.
//

import UIKit
import YDS
import SnapKit

class ChipPageViewController: StoryBookViewController {
    
    let sampleButton: YDSChip = {
        let button = YDSChip()
        return button
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
        self.title = "Chip"
    }
    
    private func setViewHierarchy() {
        sampleView.addSubview(sampleButton)
    }
    
    private func setAutolayout() {
        sampleButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "3") { [weak self] value in
            self?.sampleButton.text = value
        }

        addOption(description: "isSelected",
                  defaultValue: true) { [weak self] value in
            self?.sampleButton.isSelected = value
        }
    }
    
}
