//
//  GADRewardBasedVideoAd+Rx.swift
//  RxAdMob
//
//  Created by pinddddd on 10/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import Foundation

import GoogleMobileAds

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

public extension Reactive where Base: GADRewardBasedVideoAd {

    // Just using rewardBasedVideoAd methods
    typealias RewardBasedVideoAdWithReward = (rewardBasedVideoAd: GADRewardBasedVideoAd, reward: GADAdReward)
    typealias RewardBasedVideoAdWithError = (rewardBasedVideoAd: GADRewardBasedVideoAd, error: Error)

    // Wrapper for `isReady` property.
    var isReady: Observable<Bool> {
        return self.observeWeakly(Bool.self, "ready").unwrap()
    }

    // Wrapper for `adNetworkClassName` property.
    var adNetworkClassName: Observable<String?> {
        return self.observeWeakly(String.self, "adNetworkClassName")
    }

    // Wrapper for `userIdentifier` property.
    var userIdentifier: Observable<String?> {
        return self.observeWeakly(String.self, "userIdentifier")
    }

    // DelegateProxy Wrapper for delegate methods
    var delegate: DelegateProxy<GADRewardBasedVideoAd, GADRewardBasedVideoAdDelegate> {
        return RxGADRewardBasedVideoAdDelegateProxy.proxy(for: base)
    }

    private func rewardBasedVideoAd(_ arg: [Any]) throws -> GADRewardBasedVideoAd {
        return try castOrThrow(GADRewardBasedVideoAd.self, arg[0])
    }

    private func rewardBasedVideoAdWithReward(_ arg: [Any]) throws -> RewardBasedVideoAdWithReward {
        let rewardBasedVideoAd = try castOrThrow(GADRewardBasedVideoAd.self, arg[0])
        let reward = try castOrThrow(GADAdReward.self, arg[1])

        return (rewardBasedVideoAd, reward)
    }

    private func rewardBasedVideoAdWithError(_ arg: [Any]) throws -> RewardBasedVideoAdWithError {
        let rewardBasedVideoAd = try castOrThrow(GADRewardBasedVideoAd.self, arg[0])
        let error = try castOrThrow(Error.self, arg[1])

        return (rewardBasedVideoAd, error)
    }

    // Wrapper for method `rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didRewardUserWith reward: GADAdReward)`.
    var didRewardUser: ControlEvent<RewardBasedVideoAdWithReward> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidRewardUser)
            .map(rewardBasedVideoAdWithReward)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdDidReceive: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidReceive)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdDidOpen: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidOpen)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdDidStartPlaying: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidStartPlaying)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdDidCompletePlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdDidCompletePlaying: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidCompletePlaying)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdDidClose: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdDidClose)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd)`.
    var rewardBasedVideoAdWillLeaveApplication: ControlEvent<GADRewardBasedVideoAd> {
        let events = delegate.methodInvoked(.rewardBasedVideoAdWillLeaveApplication)
            .map(rewardBasedVideoAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd, didFailToLoadWithError error: Error)`.
    var didFailToLoadWithError: ControlEvent<RewardBasedVideoAdWithError> {
        let events = delegate.methodInvoked(.rewardBaseViewAdDidFailToLoadWithError)
            .map(rewardBasedVideoAdWithError)

        return ControlEvent(events: events)
    }
}
