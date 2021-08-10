//
//  SingleLineTopBarPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/09.
//

import UIKit
import YDS_iOS
import SnapKit

class SingleLineTopBarPageViewController: StoryBookViewController {
    
    private let sampleTopBar = YDSSingleLineTopBar()
    private let backButton: YDSBoxButton = {
        let button = YDSBoxButton()
        button.text = "뒤로가기"
        return button
    }()
    
    private let searchButton = YDSTopBarButton(image: YDSIcon.searchLine)
    private let writeButton = YDSTopBarButton(image: YDSIcon.penLine)

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
        self.title = "SingleLineTopBar"
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.view.addSubview(sampleTopBar)
        self.sampleView.addSubview(backButton)
        
        
        
        self.sampleTopBar.topItem?.setRightBarButtonItems([UIBarButtonItem(customView: writeButton),
                                                           UIBarButtonItem(customView: searchButton),],
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
    }
    
    private func registerTapAction() {
        [backButton, searchButton, writeButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case backButton:
            navigationController?.popViewController(animated: true)
        case searchButton:
            print("search")
        case writeButton:
            print("write")
        default:
            return
        }
    }

}
