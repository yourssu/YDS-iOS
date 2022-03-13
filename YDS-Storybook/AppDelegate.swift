//
//  AppDelegate.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit
import YDS

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = YDSNavigationController(title: "Storybook", rootViewController: PageListViewController())
        
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

