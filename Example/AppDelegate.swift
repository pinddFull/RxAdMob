//
//  AppDelegate.swift
//  Example
//
//  Created by pinddddd on 11/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import UIKit

import GoogleMobileAds

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        window!.rootViewController = UIViewController()
        window!.makeKeyAndVisible()

        GADMobileAds.configure(withApplicationID: "Your API Key")

        return true
    }
}

