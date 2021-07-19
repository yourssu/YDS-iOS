//
//  AppDelegate.swift
//  YDS-Sample
//
//  Created by 김윤서 on 2021/06/11.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: PageListViewController())
        // window?.rootViewController = SuffixTextFieldSampleVC()
        window?.makeKeyAndVisible()
        
        return true
    }

}

