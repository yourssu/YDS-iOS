//
//  SingleTitleTopBarSampleViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit
import YDS
import SnapKit

class SingleTitleTopBarSampleViewController: UIViewController {

    private let topBar = YDSSingleTitleTopBar(title: nil)
    private let searchButton = YDSTopBarButton(image: YDSIcon.searchLine)
    private let writeButton = YDSTopBarButton(image: YDSIcon.penLine)

    private let dismissButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "닫기"
        return button
    }()

    public struct SingleTitleTopBarModel {
        var title: String?
        var modalPresentationStyle: UIModalPresentationStyle
    }

    public var topBarInfo: SingleTitleTopBarModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        registerTapAction()
    }

    private func setupView() {
        setProperties()
        setLayouts()
    }

    private func setProperties() {
        self.view.backgroundColor = YDSColor.bgNormal
        self.topBar.title = topBarInfo?.title
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        self.view.addSubview(topBar)
        self.view.addSubview(dismissButton)
        self.topBar.topItem?.setRightBarButtonItems(
            [UIBarButtonItem(customView: writeButton),
             UIBarButtonItem(customView: searchButton)],
            animated: true)
    }

    private func setAutolayout() {
        topBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
        }

        dismissButton.snp.makeConstraints {
            $0.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-32)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().offset(-32)
        }
    }

    private func registerTapAction() {
        [dismissButton, searchButton, writeButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch sender {
        case dismissButton:
            self.dismiss(animated: true, completion: nil)
        case searchButton:
            YDSToast.makeToast(text: "Search button pressed", duration: .short)
        case writeButton:
            YDSToast.makeToast(text: "Write button pressed", duration: .short)
        default:
            return
        }
    }

}
