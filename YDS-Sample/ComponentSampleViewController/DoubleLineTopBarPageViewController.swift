//
//  DoubleLineTopBarPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit
import YDS_iOS
import SnapKit

class DoubleLineTopBarPageViewController: StoryBookViewController {
    
    private let sampleTopBar: YDSDoubleLineTopBar = {
        let topBar = YDSDoubleLineTopBar()
        topBar.title = "타이틀"
        topBar.subtitle = "서브타이틀"
        return topBar
    }()
    
    private let backButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.text = "뒤로가기"
        return button
    }()
    
    private let plusButton = YDSTopBarButton(image: YDSIcon.plusLine)
    private let listButton = YDSTopBarButton(image: YDSIcon.listLine)
    private let moreButton = YDSTopBarButton(image: YDSIcon.dotsVerticalLine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addOptions()
        setupView()
        registerTapAction()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupView() {
        setViewProperty()
        setLayouts()
    }
    
    private func setViewProperty() {
        self.title = "DoubleLineTopBar"
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(sampleTopBar)
        self.sampleView.addSubview(backButton)
        
        self.sampleTopBar.topItem?.setRightBarButtonItems(
            [UIBarButtonItem(customView: moreButton),
             UIBarButtonItem(customView: listButton),
             UIBarButtonItem(customView: plusButton)],
            animated: true)
    }
    
    private func setAutolayout() {
        sampleTopBar.snp.makeConstraints {
            $0.centerX.width.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
        }
        
        backButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func addOptions() {
        addOption(description: "title",
                  defaultValue: "타이틀") { [weak self] value in
            self?.sampleTopBar.title = value
        }
        
        addOption(description: "title",
                  defaultValue: "서브타이틀") { [weak self] value in
            self?.sampleTopBar.subtitle = value
        }
    }
    
    private func registerTapAction() {
        [backButton, moreButton, listButton, plusButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case backButton:
            self.navigationController?.popViewController(animated: true)
        case plusButton:
            print("plus")
        case listButton:
            print("list")
        case moreButton:
            print("more")
        default:
            return
        }
    }

}
