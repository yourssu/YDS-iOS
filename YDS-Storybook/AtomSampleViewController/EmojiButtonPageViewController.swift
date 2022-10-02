//
//  EmojiButtonPageViewController.swift
//  YDS-Storybook
//
//  Created by 김윤서 on 2022/03/22.
//

import UIKit
import YDS
import SnapKit

class EmojiButtonPageViewController: StoryBookViewController {

    let sampleButton: YDSEmojiButton = {
        let button = YDSEmojiButton()
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
        self.title = "EmojiButton"
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
        addOption(description: "emoji",
                  defaultValue: "💜") { [weak self] value in
            self?.sampleButton.emoji = value
        }

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
