//
//  ToastPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/05.
//

import UIKit
import YDS
import SnapKit

class ToastPageViewController: StoryBookViewController {

    private struct ToastModel {
        var text: String?
        var duration: YDSToast.ToastDuration
    }

    private var toastInfo = ToastModel(duration: .long)

    private let showToastButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "토스트 생성"
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
        self.title = "Toast"
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        self.view.addSubview(showToastButton)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        showToastButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
        }
    }

    private func addOptions() {
        addOption(description: "text",
                  defaultValue: "동해물과 백두산이 마르고 닳도록") { [weak self] value in
            self?.toastInfo.text = value
        }

        addOption(description: "duration",
                  cases: YDSToast.ToastDuration.allCases,
                  defaultIndex: 0) { [weak self] value in
            self?.toastInfo.duration = value
        }
    }

    private func registerTapAction() {
        showToastButton.addTarget(
            self,
            action: #selector(buttonTapAction(_:)),
            for: .touchUpInside
        )
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case showToastButton:
            YDSToast.makeToast(text: toastInfo.text,
                               duration: toastInfo.duration)
        default:
            return
        }
    }

}

extension YDSToast.ToastDuration: CaseIterable {
    public static var allCases: [YDSToast.ToastDuration] = [.long, .short]
}
