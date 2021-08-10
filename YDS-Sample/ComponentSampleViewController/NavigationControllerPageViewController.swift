//
//  YDSNavigationControllerPageViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/10.
//

import UIKit
import YDS_iOS
import SnapKit

class NavigationControllerPageViewController: StoryBookViewController {
    
    private let doneButton = YDSTopBarButton(text: "완료")
    private let cancelButton = YDSTopBarButton(text: "취소")

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
        self.title = "NavigationController"
    }
    
    private func setLayouts() {
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewHierarchy() {
        self.navigationItem.setLeftBarButton(UIBarButtonItem(customView: cancelButton), animated: true)
        self.navigationItem.setRightBarButton(UIBarButtonItem(customView: doneButton), animated: true)
    }
    
    private func setAutolayout() {
       
    }
    
    private func addOptions() {
        
    }
    
    private func registerTapAction() {
        [doneButton, cancelButton].forEach {
            $0.addTarget(self, action: #selector(buttonTapAction(_:)), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonTapAction(_ sender: UIButton) {
        switch(sender) {
        case doneButton:
            print("done")
        case cancelButton:
            navigationController?.popViewController(animated: true)
        default:
            return
        }
    }

}
