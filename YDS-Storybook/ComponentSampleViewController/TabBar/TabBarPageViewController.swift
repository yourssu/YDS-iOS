//
//  TabBarPageViewController.swift
//  YDS-Storybook
//
//  Created by Yonghyun on 2022/06/05.
//

import Foundation
import UIKit
import SnapKit
import YDS

class TabBarPageViewController: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .systemBackground
        
        let button0 = UIButton()
        button0.backgroundColor = .blue
        
        self.view.addSubview(button0)
        
        button0.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.top.equalToSuperview().offset(200)
        }
        
        button0.addTarget(self, action: #selector(button0TapAction(_:)), for: .touchUpInside)
        
        let button1 = UIButton()
        button1.backgroundColor = .green
        
        self.view.addSubview(button1)
        
        button1.snp.makeConstraints {
            $0.width.height.equalTo(100)
            $0.bottom.equalToSuperview().inset(200)
        }
        
        button1.addTarget(self, action: #selector(button1TapAction(_:)), for: .touchUpInside)
    }
    
    @objc
    private func button0TapAction(_ sender: UIButton) {
        let viewControllers = [
            ContentViewController(index: 0),
            ContentViewController(index: 1),
            ContentViewController(index: 2),
            ContentViewController(index: 3),
            ContentViewController(index: 4),
            ContentViewController(index: 5),
            ContentViewController(index: 6),
            ContentViewController(index: 7),
        ]
        
        let vc = PagingViewController(type: .scrollable,
                                      viewControllers: viewControllers)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func button1TapAction(_ sender: UIButton) {
        let viewControllers = [
            ContentViewController(index: 0),
            ContentViewController(index: 1),
            ContentViewController(index: 2),
//            ContentViewController(index: 3),
        ]
        
        let vc = PagingViewController(type: .fixed,
                                      viewControllers: viewControllers)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
