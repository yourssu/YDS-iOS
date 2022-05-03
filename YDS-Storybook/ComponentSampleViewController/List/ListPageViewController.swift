//
//  ListPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/05/03.
//

import UIKit
import YDS
import SnapKit

class ListPageViewController: StoryBookViewController {
    
    private var subheaderTitle: String = "MY" {
        didSet {
            list.subheaderTitle = subheaderTitle
        }
    }
    
    private var list: YDSList = {
        let list = YDSList(subheaderTitle: "MY")
        return list
    }()
    
    private var listItem1: YDSListItem = {
        let listItem = YDSListItem(title: "비밀번호 변경")
        return listItem
    }()
    
    private var listItem2: YDSListItem = {
        let listItem = YDSListItem(title: "계정 관리",
                                   showNextIconView: true)
        return listItem
    }()
    
    private var listToggleItem: YDSListToggleItem = {
        let listToggleItem = YDSListToggleItem(title: "알림 받기")
        return listToggleItem
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
        self.title = "List"
    }

    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }

    private func setViewHierarchy() {
        sampleView.addSubview(list)
        list.addArrangedSubview(listItem1, listItem2, listToggleItem)
        stackView.addArrangedSubview(spacer)
    }

    private func setAutolayout() {
        list.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
        
        
    }

    private func addOptions() {
        addOption(description: "Subheader hidden",
                  defaultValue: true) { [weak self] value in
            if value {
                self?.list.subheaderTitle = self?.subheaderTitle
            } else {
                self?.list.subheaderTitle = nil
            }
        }
    }

    private func registerTapAction() {
        listItem1.button.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        listItem2.button.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        listToggleItem.toggle.addTarget(self, action: #selector(didToggleValueChanged(_:)), for: .touchUpInside)
    }

    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case listItem1.button:
            YDSToast.makeToast(text: "1번째 List Item 선택", duration: .short)
        case listItem2.button:
            YDSToast.makeToast(text: "2번째 List Item 선택", duration: .short)
        default:
            return
        }
    }
    
    @objc
    private func didToggleValueChanged(_ toggle: YDSToggle) {
        switch(toggle) {
        case listToggleItem.toggle:
            YDSToast.makeToast(text: "List Toggle Item \(toggle.isOn)", duration: .short)
        default:
            return
        }
    }
}
