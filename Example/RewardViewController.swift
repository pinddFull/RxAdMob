//
//  RewardViewController.swift
//  Example
//
//  Created by pinddddd on 11/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa
import RxAdMob
import GoogleMobileAds

class RewardViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("ShowRewardVideo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.center = self.view.center

        self.view.addSubview(button)

        let key = "Your API Key"

        let rewardInstance = GADRewardBasedVideoAd.sharedInstance()
        rewardInstance.load(GADRequest(), withAdUnitID: key)

        rewardInstance.rx.isReady
            .asDriver(onErrorJustReturn: false)
            .drive(button.rx.isEnabled)
            .disposed(by: disposeBag)

        rewardInstance.rx.didRewardUser.asDriver()
            .drive(onNext: { videoAD, reward in
                print("Did reward user - amount: \(reward.amount)")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.didFailToLoadWithError.asDriver()
            .drive(onNext: { videoAD, error in
                print("Did fail to load error: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdDidReceive.asDriver()
            .drive(onNext: { videoAD in
                print("Did receive.")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdDidOpen.asDriver()
            .drive(onNext: { videoAD in
                print("Did open")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdDidClose.asDriver()
            .drive(onNext: { videoAD in
                rewardInstance.load(GADRequest(), withAdUnitID: key)
                print("Did close")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdDidStartPlaying.asDriver()
            .drive(onNext: { videoAD in
                print("Did start playing")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdDidCompletePlaying.asDriver()
            .drive(onNext: { videoAD in
                print("Did complete playing")
            })
            .disposed(by: disposeBag)

        rewardInstance.rx.rewardBasedVideoAdWillLeaveApplication.asDriver()
            .drive(onNext: { videoAD in
                print("Will leave apllication")
            })
            .disposed(by: disposeBag)
    }
}
