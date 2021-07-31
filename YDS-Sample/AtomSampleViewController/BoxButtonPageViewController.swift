//
//  BoxButtonPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS_iOS
import SnapKit

class BoxButtonPageViewController: StoryBookViewController {
        
    let sampleButton: YDSBoxButton = {
        let button = YDSBoxButton()
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
        self.title = "BoxButton"
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
                  images: [YDSIcon.playcircleFilled, YDSIcon.groundFilled],
                  defaultIndex: nil) {
            self.sampleButton.leftIcon = $0
        }
        
        addOption(description: "rightIcon",
                  images: [YDSIcon.playcircleFilled, YDSIcon.groundFilled],
                  defaultIndex: nil) {
            self.sampleButton.rightIcon = $0
        }
        
        addOption(description: "type",
                  cases: YDSBoxButton.BoxButtonType.allCases,
                  defaultIndex: 0) {
            self.sampleButton.type = $0
        }
        
        addOption(description: "size",
                  cases: YDSBoxButton.BoxButtonSize.allCases,
                  defaultIndex: 0) {
            self.sampleButton.size = $0
        }
        
        addOption(description: "rounding",
                  cases: YDSBoxButton.BoxButtonRounding.allCases,
                  defaultIndex: 0) {
            self.sampleButton.rounding = $0
        }
        
        addOption(description: "isDisabled",
                  defaultValue: false) {
            self.sampleButton.isDisabled = $0
        }
        
        addOption(description: "isWarned",
                  defaultValue: false) {
            self.sampleButton.isWarned = $0
        }
    }
    
    

}

extension YDSBoxButton.BoxButtonType: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonType] = [.filled, .tinted, .line]
}

extension YDSBoxButton.BoxButtonSize: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonSize] = [.extraLarge, .large, .medium, .small]
}

extension YDSBoxButton.BoxButtonRounding: CaseIterable {
    public static var allCases: [YDSBoxButton.BoxButtonRounding] = [.r8, .r4]
}
