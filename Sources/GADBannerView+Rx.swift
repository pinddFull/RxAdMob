//
//  GADBannerView+Rx.swift
//  RxAdMob
//
//  Created by pinddddd on 11/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import Foundation

import GoogleMobileAds

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

extension Reactive where Base: GADBannerView {

    // Using adView methods
    public typealias BannerViewWithError = (bannerView: GADBannerView, error: Error)

    // Wrapper for `adUnitID` property
    public var adUnitID: Observable<String?> {
        return self.observeWeakly(String.self, "adUnitID")
    }

    // Wrapper for `rootViewController` property
    public var rootViewController: Observable<UIViewController?> {
        return self.observeWeakly(UIViewController.self, "rootViewController")
    }

    // Wrapper for `adSize` property
    public var adSize: Observable<GADAdSize> {
        return self.observeWeakly(GADAdSize.self, "adSize").unwrap()
    }

    // Wrapper for `adNetworkClassName` property
    public var adNetworkClassName: Observable<String?> {
        return self.observeWeakly(String.self, "adNetworkClassName")
    }

    // DelegateProxy Wrapper for delegate methods
    public var delegate: RxGADBannerViewDelegate {
        return RxGADBannerViewDelegateProxy.proxy(for: base)
    }

    private func bannerView(_ arg: [Any]) -> GADBannerView {
        return arg.first as! GADBannerView
    }

    private func bannerViewWithError(_ arg: [Any]) -> BannerViewWithError {
        let bannerView = arg[0] as! GADBannerView
        let error = arg[1] as! Error

        return (bannerView, error)
    }

    // Wrapper for method `adViewDidReceiveAd(_ bannerView: GADBannerView)`.
    public var adViewDidReceiveAd: ControlEvent<GADBannerView> {
        let events = delegate.methodInvoked(.adViewDidReceiveAd)
            .map(bannerView)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: GADRequestError)`.
    public var didFailToReceiveAdWithError: ControlEvent<BannerViewWithError> {
        let events = delegate.methodInvoked(.adViewdidFailToReceiveAdWithError)
            .map(bannerViewWithError)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adViewWillPresentScreen(_ bannerView: GADBannerView)`.
    public var adViewWillPresentScreen: ControlEvent<GADBannerView> {
        let events = delegate.methodInvoked(.adViewWillPresentScreen)
            .map(bannerView)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adViewWillDismissScreen(_ bannerView: GADBannerView)`.
    public var adViewWillDismissScreen: ControlEvent<GADBannerView> {
        let events = delegate.methodInvoked(.adViewDidDismissScreen)
            .map(bannerView)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adViewDidDismissScreen(_ bannerView: GADBannerView)`.
    public var adViewDidDismissScreen: ControlEvent<GADBannerView> {
        let events = delegate.methodInvoked(.adViewDidDismissScreen)
            .map(bannerView)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adViewWillLeaveApplication(_ bannerView: GADBannerView)`.
    public var adViewWillLeaveApplication: ControlEvent<GADBannerView> {
        let events = delegate.methodInvoked(.adViewWillLeaveApplication)
            .map(bannerView)

        return ControlEvent(events: events)
    }
}
