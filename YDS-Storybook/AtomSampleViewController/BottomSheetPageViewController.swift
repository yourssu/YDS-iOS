//
//  BottomSheetPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/01/23.
//

import UIKit
import YDS
import SnapKit

final class BottomSheetPageViewController: StoryBookViewController {
    
    private let showBottomSheetButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "바텀시트 생성"
        return button
    }()

    private let spacer: UIView = {
        let view = UIView()
        view.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        return view
    }()
    
    private var viewsArrs: [[UIView]] = []
    private let names: [String] = ["iOS", "Android", "Web FrontEnd", "Backend"]
    private var views: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewArrs()
        addOptions()
        setupView()
        registerTapAction()
    }
    
    private func addOptions() {
        if let defaultViews = viewsArrs.first {
            addOption(description: "views",
                      viewsArrs: viewsArrs,
                      defaultViews: defaultViews) { [weak self] value in
                self?.views = value
            }
        }
    }

    private func setupView() {
        setViewProperty()
        setLayouts()
    }

    private func setViewProperty() {
        self.title = "BottomSheet"
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        self.view.addSubview(showBottomSheetButton)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        showBottomSheetButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        }
    }

    private func registerTapAction() {
        showBottomSheetButton.addTarget(
            self,
            action: #selector(buttonTapAction(_:)),
            for: .touchUpInside
        )
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case showBottomSheetButton:
            let bottomSheet = YDSBottomSheet()
            bottomSheet.addViews(views: views)
            self.presentPanModal(bottomSheet)
        default:
            return
        }
    }
    
    private func setViewArrs() {
        for i in 0..<names.count {
            for j in 0...i {
                let label = YDSLabel(style: .title1)
                label.text = names[j]
                
                if j == 0 {
                    viewsArrs.append([label])
                } else {
                    viewsArrs[i].append(label)
                }
            }
        }
    }
}
