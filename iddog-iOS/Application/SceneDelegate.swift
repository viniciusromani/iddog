//
//  SceneDelegate.swift
//  iddog-iOS
//
//  Created by Fellipe Caetano on 02/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else {
            return
        }

        window = UIWindow(windowScene: windowScene)
        coordinator = AppCoordinator(window: window)
        coordinator.start()
    }
}
