//
//  TooltipPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/03/26.
//

import UIKit
import YDS
import SnapKit

class TooltipPageViewController: StoryBookViewController {

    let tooltip: YDSTooltip = {
        let tooltip = YDSTooltip(text: "",
                                 color: .tooltipPoint,
                                 tailPosition: .bottomRight,
                                 duration: .short)
        return tooltip
    }()

    private let pushButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "샘플 페이지 보기"
        return button
    }()
    
    private let spacer: UIView = {
        let view = UIView()
        view.snp.makeConstraints {
            $0.height.equalTo(60)
        }
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addOptions()
        setupView()
        registerTapAction()
    }

    private func setupView() {
        setViewProperty()
        setLayouts()
    }

    private func setViewProperty() {
        self.title = "Tooltip"
        self.tooltip.alpha = 1.0
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        sampleView.addSubview(tooltip)
        self.view.addSubviews(pushButton)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        tooltip.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        pushButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        }
    }

    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "홈에서 실시간 피드를 확인해보세요!") { [weak self] value in
            self?.tooltip.text = value
        }

        addOption(description: "color",
                  cases: YDSTooltip.TooltipColor.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.tooltip.color = value
        }

        addOption(description: "tailPosition",
                  cases: YDSTooltip.TailPosition.allCases,
                  defaultIndex: 2) { [weak self] value in
            self?.tooltip.tailPosition = value
        }

        addOption(description: "duration",
                  cases: YDSTooltip.TooltipDuration.allCases,
                  defaultIndex: 1) { [weak self] value in
            self?.tooltip.duration = value
        }
    }

    private func registerTapAction() {
        pushButton.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case pushButton:
            let sampleViewController: TooltipSampleViewController = {
                let viewController = TooltipSampleViewController()
                viewController.tooltip.text = self.tooltip.text
                viewController.tooltip.color = self.tooltip.color
                viewController.tooltip.tailPosition = self.tooltip.tailPosition
                viewController.tooltip.duration = self.tooltip.duration
                return viewController
            }()
            
            self.navigationController?.pushViewController(sampleViewController, animated: true)
        default:
            return
        }
    }
}

extension YDSTooltip.TooltipColor: CaseIterable {
    public static var allCases: [YDSTooltip.TooltipColor] = [.tooltipPoint, .tooltipBG]
}

extension YDSTooltip.TailPosition: CaseIterable {
    public static var allCases: [YDSTooltip.TailPosition] = [.left, .right, .topLeft, .bottomLeft, .topCenter, .bottomCenter, .topRight, .bottomRight]
}

extension YDSTooltip.TooltipDuration: CaseIterable {
    public static var allCases: [YDSTooltip.TooltipDuration] = [.short, .long]
}
