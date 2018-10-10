//
//  GADInterstitial+Rx.swift
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

extension Reactive where Base: GADInterstitial {

    public typealias InterstitialWithError = (interstitial: GADInterstitial, error: Error)

    // Wrapper for `adUnitID` property
    public var adUnitID: Observable<String?> {
        return self.observeWeakly(String.self, "adUnitID")
    }

    // Wrapper for `isReady` property
    public var isReady: Observable<Bool> {
        return self.observeWeakly(Bool.self, "isReady").unwrap()
    }

    // Wrapper for `hasBeenUsed` property
    public var hasBeenUsed: Observable<Bool> {
        return self.observeWeakly(Bool.self, "hasBeenUseed").unwrap()
    }

    // Wrapper for `adNetworkClassName` property
    public var adNetworkClassName: Observable<String?> {
        return self.observeWeakly(String.self, "adNetworkClassName")
    }

    // DelegateProxy Wrapper for delegate methods
    public var delegate: RxGADInterstitialDelegate {
        return RxGADInterstitialDelegateProxy.proxy(for: base)
    }

    private func interstitial(_ arg: [Any]) throws -> GADInterstitial {
        return try castOrThrow(GADInterstitial.self, arg[0])
    }

    private func interstitialWithError(_ arg: [Any]) throws -> InterstitialWithError {
        let interstitial = try castOrThrow(GADInterstitial.self, arg[0])
        let error = try castOrThrow(Error.self, arg[1])

        return (interstitial, error)
    }

    // Wrapper for method `interstitialDidReceiveAd(_ ad: GADInterstitial)`.
    public var interstitialDidReceiveAd: ControlEvent<GADInterstitial> {
        let events = delegate.methodInvoked(.interstitialDidReceiveAd)
            .map(interstitial)

        return ControlEvent(events: events)
    }

    // Wrapper for method `interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError)`.
    public var didFailToReceiveAdWithError: ControlEvent<InterstitialWithError> {
        let events = delegate.methodInvoked(.intersitialDidFailToReceiveAdWithError)
            .map(interstitialWithError)

        return ControlEvent(events: events)
    }

    // Wrapper for method `interstitialWillPresentScreen(_ ad: GADInterstitial)`.
    public var interstitialWillPresentScreen: ControlEvent<GADInterstitial> {
        let events = delegate.methodInvoked(.interstitialWillPresentScreen)
            .map(interstitial)

        return ControlEvent(events: events)
    }

    // Wrapper for method `interstitialWillDismissScreen(_ ad: GADInterstitial)`.
    public var interstitialWillDismissScreen: ControlEvent<GADInterstitial> {
        let events = delegate.methodInvoked(.interstitialWillDismissScreen)
            .map(interstitial)

        return ControlEvent(events: events)
    }

    // Wrapper for method `interstitialDidDismissScreen(_ ad: GADInterstitial)`.
    public var interstitialDidDismissScreen: ControlEvent<GADInterstitial> {
        let events = delegate.methodInvoked(.interstitialDidDismissScreen)
            .map(interstitial)

        return ControlEvent(events: events)
    }

    // Wrapper for method `interstitialWillLeaveApplication(_ ad: GADInterstitial)`.
    public var interstitialWillLeaveApplication: ControlEvent<GADInterstitial> {
        let events = delegate.methodInvoked(.interstitialWillLeaveApplication)
            .map(interstitial)

        return ControlEvent(events: events)
    }
}
