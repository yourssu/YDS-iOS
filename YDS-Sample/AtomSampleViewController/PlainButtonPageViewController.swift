//
//  PlainButtonPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/31.
//

import UIKit
import YDS_iOS
import SnapKit

class PlainButtonPageViewController: StoryBookViewController {
        
    let sampleButton: YDSPlainButton = {
        let button = YDSPlainButton()
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
        self.title = "PlainButton"
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
                  defaultValue: "재생") {
            self.sampleButton.text = $0
        }
        
        addOption(description: "leftIcon",
                  images: ydsIconArray,
                  defaultIndex: 0) {
            self.sampleButton.leftIcon = $0
        }
        
        addOption(description: "rightIcon",
                  images: ydsIconArray,
                  defaultIndex: nil) {
            self.sampleButton.rightIcon = $0
        }
        
        addOption(description: "size",
                  cases: YDSPlainButton.PlainButtonSize.allCases,
                  defaultIndex: 0) {
            self.sampleButton.size = $0
        }
    
        addOption(description: "isDisabled",
                  defaultValue: false) {
            self.sampleButton.isDisabled = $0
        }
        
        addOption(description: "isWarned",
                  defaultValue: false) {
            self.sampleButton.isWarned = $0
        }
        
        addOption(description: "isPointed",
                  defaultValue: false) {
            self.sampleButton.isPointed = $0
        }
    }

}

extension YDSPlainButton.PlainButtonSize: CaseIterable {
    public static var allCases: [YDSPlainButton.PlainButtonSize] = [.large, .medium, .small]
}
