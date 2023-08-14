//
//  CheckboxPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/03.
//

import UIKit
import YDS
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
        registerTapAction()
    }

    private func setupView() {
        setViewProperty()
        setLayouts()
        registerTapAction()
    }

    private func setViewProperty() {
        self.title = "Checkbox"
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
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
                  cases: YDSCheckbox.CheckboxSize.allCases,
                  defaultIndex: 1) { [weak self] value in
            self?.sampleCheckbox.size = value
        }

        addOption(description: "isDisabled",
                  defaultValue: false) { [weak self] value in
            self?.sampleCheckbox.isDisabled = value
        }

    }

    private func registerTapAction() {
        sampleCheckbox.addTarget(self,
                                 action: #selector(printIsSelected(_:)),
                                 for: .touchUpInside)
    }

    @objc
    private func printIsSelected(_ sender: UIControl) {
        print(sampleCheckbox.isSelected)
    }

}

extension YDSCheckbox.CheckboxSize: CaseIterable {
    public static var allCases: [YDSCheckbox.CheckboxSize] = [.large, .medium, .small]
}
