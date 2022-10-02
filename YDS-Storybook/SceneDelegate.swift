//
//  SceneDelegate.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/04/02.
//

import UIKit
import YDS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigationController = YDSNavigationController(title: "Storybook",
                                                           rootViewController: PageListViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
