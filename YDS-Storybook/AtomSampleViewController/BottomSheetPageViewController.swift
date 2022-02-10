//
//  BottomSheetPageViewController.swift
//  YDS-Storybook
//
//  Created by Gyuni on 2022/01/30.
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
    
    private var numberOfViews: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        addOptions()
        setupView()
        registerTapAction()
    }
    
    private func addOptions() {
        addOption(description: "Views",
                  typeDescription: "[UIView]",
                  cases: ExampleCase.allCases,
                  defaultIndex: ExampleCase.allCases.count - 1) { [weak self] value in
            self?.numberOfViews = value.rawValue
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
            let views = YourssuDevTeam.allCases[0..<numberOfViews]
                .map { $0.rawValue }
                .map { text -> UIView in
                    let label = YDSLabel(style: .title1)
                    label.text = text
                    label.snp.makeConstraints {
                        $0.width.equalTo(YDSScreenSize.width - 48)
                    }
                    return label
                }
            bottomSheet.addViews(views: views)
            self.presentPanModal(bottomSheet)
        default:
            return
        }
    }
    
    enum YourssuDevTeam: String, CaseIterable {
        case iOS = "iOS"
        case android = "Android"
        case be = "Backend"
        case fe = "Frontend"
    }

    enum ExampleCase: Int, CaseIterable {
        case zero = 0
        case one = 1
        case two = 2
        case three = 3
        case four = 4
    }
}
