//
//  AppDelegate.swift
//  HCI project
//
//  Created by Mufaza Majeed on 11/23/19.
//  Copyright © 2019 Mufaza Majeed. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
     var navigationController: UINavigationController = UINavigationController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        var navigationBarAppearace = UINavigationBar.appearance()
//        navigationBarAppearace.tintColor = UIColor(named: "#A5D0CC")
//        navigationBarAppearace.barTintColor = UIColor(named: "#A5D0CC")
        
        self.navigationController.setNavigationBarHidden(false, animated: true)
        
        UIApplication.shared.statusBarStyle = .default
//
//        appDelegate?.window?.makeKeyAndVisible()
        return true
    }




}

