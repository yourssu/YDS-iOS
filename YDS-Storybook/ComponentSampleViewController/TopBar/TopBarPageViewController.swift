//
//  TopBarPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/11.
//

//
//  TopBarSampleViewController를 생성하기 위해 준비하는 ViewController 입니다.
//  TopBar를 사용한 샘플 코드는 TopBarSampleViewController를 참고해주세요.
//

import UIKit
import YDS
import SnapKit

class TopBarPageViewController: StoryBookViewController {

    public var topBarInfo = TopBarSampleViewController.TopBarModel(title: "타이틀", modalPresentationStyle: .fullScreen)

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
        self.title = "TopBar"
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
                  defaultValue: "TopBar") { [weak self] value in
            self?.topBarInfo.title = value
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
        switch sender {
        case presentButton:
            let sampleViewController: TopBarSampleViewController = {
                let viewController = TopBarSampleViewController()
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
