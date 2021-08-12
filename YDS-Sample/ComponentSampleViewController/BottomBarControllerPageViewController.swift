//
//  BottomBarViewController.swift
//  YDS-Sample
//
//  Created by Gyuni on 2021/08/07.
//

import UIKit
import YDS_iOS
import SnapKit

class BottomBarControllerPageViewController: YDSBottomBarController {
    
    let page1: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = YDSColor.pinkItemBG
        viewController.tabBarItem = UITabBarItem(title: nil, image: YDSIcon.homeLine, selectedImage: YDSIcon.homeFilled)
        return viewController
    }()
    
    let page2: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = YDSColor.aquaItemBG
        viewController.tabBarItem = UITabBarItem(title: nil, image: YDSIcon.boardLine, selectedImage: YDSIcon.boardFilled)
        return viewController
    }()
    
    let page3: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = YDSColor.emeraldItemBG
        viewController.tabBarItem = UITabBarItem(title: nil, image: YDSIcon.timecalendarLine, selectedImage: YDSIcon.timecalendarFilled)
        return viewController
    }()
    
    let page4: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = YDSColor.indigoItemBG
        viewController.tabBarItem = UITabBarItem(title: nil, image: YDSIcon.rankLine, selectedImage: YDSIcon.rankFilled)
        return viewController
    }()
    
    let page5: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = YDSColor.monoItemBG
        viewController.tabBarItem = UITabBarItem(title: nil, image: YDSIcon.personLine, selectedImage: YDSIcon.personFilled)
        return viewController
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        self.viewControllers = [page1, page2, page3, page4, page5]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
