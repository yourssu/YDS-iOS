//
//  SceneDelegate.swift
//  YDS-Storybook
//
//  Created by 강민석 on 2022/04/02.
//

import UIKit
import SwiftUI
import YDS
import YDS_SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let tabBarController = YDSBottomBarController()
        let navigationController = YDSNavigationController(title: "Storybook",
                                                           rootViewController: PageListViewController())
        let navigationControllerSwiftUI = UIHostingController(rootView: PageListView())

        let swiftImage = UIImage(systemName: "swift")
        let uikitImage = swiftImage?.withTintColor(.systemOrange, renderingMode: .alwaysOriginal)
        let swiftUIImage = swiftImage?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        navigationController.tabBarItem = UITabBarItem(
            title: "UIKit",
            image: swiftImage,
            selectedImage: uikitImage
        )
        navigationControllerSwiftUI.tabBarItem = UITabBarItem(
            title: "SwiftUI",
            image: swiftImage,
            selectedImage: swiftUIImage
        )
        tabBarController.setViewControllers([navigationController, navigationControllerSwiftUI], animated: true)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

}
