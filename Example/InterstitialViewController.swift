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

class InterstitialViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let button = UIButton()
        button.setTitle("ShowAd", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.frame.size = CGSize(width: 100, height: 100)
        button.center = self.view.center

        self.view.addSubview(button)

        let interstitial = GADInterstitial(adUnitID: "Your API Key")
        interstitial.load(GADRequest())

        button.rx.tap
            .filter { interstitial.isReady }
            .subscribe(onNext: { [weak self] isReady in
                guard let self = self else { return }
                interstitial.present(fromRootViewController: self)
            }).disposed(by: disposeBag)

        interstitial.rx.interstitialDidDismissScreen.asDriver()
            .drive(onNext: { interstitial in
                print("Did dismiss screen")
                interstitial.load(GADRequest())
            })
            .disposed(by: disposeBag)

        interstitial.rx.interstitialDidReceiveAd.asDriver()
            .drive(onNext: { interstitial in
                print("Did receive ad")
            })
            .disposed(by: disposeBag)

        interstitial.rx.interstitialWillDismissScreen.asDriver()
            .drive(onNext: { interstitial in
                print("Will dismiss screen")
            })
            .disposed(by: disposeBag)

        interstitial.rx.interstitialWillPresentScreen.asDriver()
            .drive(onNext: { interstitial in
                print("Will present screen")
            })
            .disposed(by: disposeBag)

        interstitial.rx.interstitialWillLeaveApplication.asDriver()
            .drive(onNext: { interstitial in
                print("Will leave application")
            })
            .disposed(by: disposeBag)
    }
}

