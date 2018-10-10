//
//  GADRewardBasedVideoAdDelegateProxy.swift
//  RxAdMob
//
//  Created by pinddddd on 04/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import GoogleMobileAds

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

public typealias RxGADRewardBasedVideoAdDelegate = DelegateProxy<GADRewardBasedVideoAd, GADRewardBasedVideoAdDelegate>

open class RxGADRewardBasedVideoAdDelegateProxy: RxGADRewardBasedVideoAdDelegate, DelegateProxyType, GADRewardBasedVideoAdDelegate {

    // Require call method
    public func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward) {}

    public init(parentObject: GADRewardBasedVideoAd) {
        super.init(parentObject: parentObject, delegateProxy: RxGADRewardBasedVideoAdDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADRewardBasedVideoAdDelegateProxy in
            RxGADRewardBasedVideoAdDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADRewardBasedVideoAd) -> GADRewardBasedVideoAdDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: GADRewardBasedVideoAdDelegate?, to object: GADRewardBasedVideoAd) {
        object.delegate = delegate
    }
}

