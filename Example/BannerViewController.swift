//
//  BannerViewController.swift
//  Example
//
//  Created by pinddddd on 11/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import GoogleMobileAds
import RxAdMob

class BannerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let bannerView = GADBannerView(adSize: kGADAdSizeBanner)
//        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.center = self.view.center

        self.view.addSubview(bannerView)

        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
    }

}

