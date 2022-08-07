//
//  YDSTabBarViewController.swift
//  YDS
//
//  Created by Yonghyun on 2022/06/18.
//

import UIKit
import SnapKit
import Parchment

public class YDSTabBarViewController: UIViewController {
    public init(type: PagingViewController.TabBarType, viewControllers: [UIViewController]) {
        let pagingViewController: PagingViewController = PagingViewController(type: type,
                                                                              viewControllers: viewControllers,
                                                                              font: YDSFont.button2,
                                                                              selectedFont: YDSFont.button2,
                                                                              textColor: YDSColor.bottomBarNormal,
                                                                              selectedTextColor: YDSColor.bottomBarSelected,
                                                                              indicatorColor: YDSColor.bottomBarSelected)
        
        super.init(nibName: nil, bundle: nil)
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        
        pagingViewController.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        pagingViewController.didMove(toParent: self)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
