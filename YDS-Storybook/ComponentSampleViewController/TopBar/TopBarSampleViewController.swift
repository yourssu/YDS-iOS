//
//  TopBarSampleViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/11.
//

import UIKit
import YDS
import SnapKit

class TopBarSampleViewController: UIViewController {
    
    private let topBar = YDSTopBar()
    private let editButton = YDSTopBarButton(text: "편집")
    private let starButton = YDSTopBarButton(image: YDSIcon.starLine)
    
    private let dismissButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.size = .large
        button.rounding = .r8
        button.type = .filled
        button.text = "닫기"
        return button
    }()
    
    public struct TopBarModel {
        var title: String?
        var modalPresentationStyle: UIModalPresentationStyle
    }

    public var topBarInfo: TopBarModel?
    
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
        self.topBar.topItem?.title = topBarInfo?.title
        editButton.setTitle("완료", for: .selected)
        starButton.setImage(YDSIcon.starFilled, for: .selected)
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(topBar)
        self.view.addSubview(dismissButton)
        self.topBar.topItem?.setLeftBarButton(UIBarButtonItem(customView: starButton), animated: true)
        self.topBar.topItem?.setRightBarButton(UIBarButtonItem(customView: editButton), animated: true)
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
        [dismissButton, editButton, starButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case editButton, starButton:
            sender.isSelected.toggle()
        case dismissButton:
            self.dismiss(animated: true, completion: nil)
        default:
            return
        }
    }

}
