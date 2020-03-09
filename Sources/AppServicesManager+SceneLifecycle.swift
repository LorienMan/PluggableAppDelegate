//
//  AppServicesManager+SceneLifecycle.swift
//  PluggableAppDelegate
//
//  Created by Ilya Amelchenkov on 09.03.2020.
//  Copyright © 2020 Ilya Amelchenkov. All rights reserved.
//

import Foundation

extension PluggableApplicationDelegate {

    @available(iOS 13.0, *)
    open func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        var result: UISceneConfiguration?
        for service in _services {
            if let configuration = service.application?(application, configurationForConnecting: connectingSceneSession, options: options) {
                result = configuration
            }
        }

        return result ?? UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    open func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        for service in _services {
            service.application?(application, didDiscardSceneSessions: sceneSessions)
        }
    }
}
