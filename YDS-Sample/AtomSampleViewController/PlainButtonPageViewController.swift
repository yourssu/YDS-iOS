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
        setLayouts()
        setViewProperty()
    }
    
    private func setViewProperty() {
        self.title = "PlainButton"
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
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
                  defaultValue: "재생") { [weak self] value in
            self?.sampleButton.text = value
        }
        
        addOption(description: "leftIcon",
                  images: ydsIconArray,
                  defaultImage: YDSIcon.playcircleFilled) { [weak self] value in
            self?.sampleButton.leftIcon = value
        }
        
        addOption(description: "rightIcon",
                  images: ydsIconArray,
                  defaultImage: YDSIcon.playcircleFilled) { [weak self] value in
            self?.sampleButton.rightIcon = value
        }
        
        addOption(description: "size",
                  cases: YDSPlainButton.PlainButtonSize.allCases,
                  defaultIndex: 1) { [weak self] value in
            self?.sampleButton.size = value
        }
    
        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleButton.isDisabled = value
        }
        
        addOption(description: "isWarned",
                  defaultValue: false) { [weak self] value in
            self?.sampleButton.isWarned = value
        }
        
        addOption(description: "isPointed",
                  defaultValue: false) { [weak self] value in
            self?.sampleButton.isPointed = value
        }
    }

}

extension YDSPlainButton.PlainButtonSize: CaseIterable {
    public static var allCases: [YDSPlainButton.PlainButtonSize] = [.large, .medium, .small]
}
