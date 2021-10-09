//
//  DoubleTitleSampleViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit
import YDS
import SnapKit

class DoubleTitleTopBarSampleViewController: UIViewController {
    
    private let topBar = YDSDoubleTitleTopBar(title: nil, subtitle: nil)
    private let plusButton = YDSTopBarButton(image: YDSIcon.plusLine)
    private let listButton = YDSTopBarButton(image: YDSIcon.listLine)
    private let moreButton = YDSTopBarButton(image: YDSIcon.dotsVerticalLine)
    
    private let dismissButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "닫기"
        return button
    }()
    
    public struct DoubleTitleTopBarModel {
        var title: String?
        var subtitle: String?
        var modalPresentationStyle: UIModalPresentationStyle
    }

    public var topBarInfo: DoubleTitleTopBarModel?

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
        self.topBar.subtitle = topBarInfo?.subtitle
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(topBar)
        self.view.addSubview(dismissButton)
        self.topBar.topItem?.setRightBarButtonItems(
            [UIBarButtonItem(customView: moreButton),
             UIBarButtonItem(customView: listButton),
             UIBarButtonItem(customView: plusButton),],
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
        [dismissButton, plusButton, listButton, moreButton].forEach {
            $0.addTarget(self, action: #selector(buttonDidTap(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case dismissButton:
            self.dismiss(animated: true, completion: nil)
        case plusButton:
            YDSToast.makeToast(text: "Plus button pressed", duration: .short)
        case listButton:
            YDSToast.makeToast(text: "List button pressed", duration: .short)
        case moreButton:
            YDSToast.makeToast(text: "More button pressed", duration: .short)
        default:
            return
        }
    }


}
