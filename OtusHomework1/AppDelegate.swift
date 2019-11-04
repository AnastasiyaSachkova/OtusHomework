//
//  AppDelegate.swift
//  OtusHomework1
//
//  Created by MacMini Elis on 28/08/2019.
//  Copyright © 2019 Anastasiya Sachkova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print(#function)
        return true
    }
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(#function)
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }

    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }


}

extension AppDelegate {
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if  let ud = UserDefaults(suiteName: "group.elis.ShareExtension") {
            guard let text = ud.object(forKey: "text") as? String else { return false }
            Router.shared.routToProfile(index: 2, text: text )
        }
        return true
    }
}
