//
//  BoxButtonPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/07/27.
//

import UIKit
import YDS
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
                  defaultValue: "재생") { [weak self] value in
            self?.sampleButton.text = value
        }

        addOption(description: "leftIcon",
                  images: ydsIconArray,
                  defaultImage: nil) { [weak self] value in
            self?.sampleButton.leftIcon = value
        }

        addOption(description: "rightIcon",
                  images: ydsIconArray,
                  defaultImage: nil) { [weak self] value in
            self?.sampleButton.rightIcon = value
        }

        addOption(description: "type",
                  cases: YDSBoxButton.BoxButtonType.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.sampleButton.type = value
        }

        addOption(description: "size",
                  cases: YDSBoxButton.BoxButtonSize.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.sampleButton.size = value
        }

        addOption(description: "rounding",
                  cases: YDSBoxButton.BoxButtonRounding.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.sampleButton.rounding = value
        }

        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleButton.isDisabled = value
        }

        addOption(description: "isWarned",
                  defaultValue: false) { [weak self] value in
            self?.sampleButton.isWarned = value
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
