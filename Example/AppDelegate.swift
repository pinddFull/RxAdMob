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
        window = UIWindow(frame: UIScreen.main.bounds)

        let bannerViewController = BannerViewController()

        window!.rootViewController = bannerViewController
        window!.makeKeyAndVisible()

        GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544~1458002511")

        return true
    }
}

