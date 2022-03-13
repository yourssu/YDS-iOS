//
//  IconsPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/03/13.
//

import UIKit
import YDS
import SnapKit

class IconsPageViewController: UIViewController {
    
    private let tableViewArea = UIView()
    private let iconsListTableViewController = IconsListTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        setViewProperties()
        setViewHierarchy()
        setAutolayout()
    }
    
    private func setViewProperties() {
        self.title = "Icon"
    }
    
    private func setViewHierarchy() {
        self.embed(iconsListTableViewController)
        self.view.addSubview(iconsListTableViewController.view)
    }
    
    private func setAutolayout() {
        iconsListTableViewController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
}
