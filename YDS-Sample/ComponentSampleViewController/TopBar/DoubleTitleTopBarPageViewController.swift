//
//  DoubleTitleTopBarPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit
import YDS_iOS
import SnapKit

class DoubleTitleTopBarPageViewController: StoryBookViewController {
    
    public var topBarInfo = DoubleTitleTopBarSampleViewController.DoubleTitleTopBarModel(title: "타이틀", subtitle: "서브타이틀", modalPresentationStyle: .fullScreen)
    
    private let presentButton: YDSBoxButton = {
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
        self.title = "DoubleLineTopBar"
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(presentButton)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        presentButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-32)
        }
    }
    
    private func addOptions() {
        addOption(description: "title",
                  defaultValue: "시간표(2안)") { [weak self] value in
            self?.topBarInfo.title = value
        }
        
        addOption(description: "title",
                  defaultValue: "2021년 2학기") { [weak self] value in
            self?.topBarInfo.subtitle = value
        }
        
        addOption(description: "modalPresentationStyle",
                  cases: [UIModalPresentationStyle.fullScreen, UIModalPresentationStyle.automatic],
                  defaultIndex: 0) { [weak self] value in
            self?.topBarInfo.modalPresentationStyle = value
        }
    }
    
    private func registerTapAction() {
        presentButton.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case presentButton:
            let sampleViewController: DoubleTitleTopBarSampleViewController = {
                let viewController = DoubleTitleTopBarSampleViewController()
                viewController.topBarInfo = topBarInfo
                viewController.modalPresentationStyle = topBarInfo.modalPresentationStyle
                return viewController
            }()
            self.present(sampleViewController, animated: true, completion: nil)
        default:
            return
        }
    }
    
}
