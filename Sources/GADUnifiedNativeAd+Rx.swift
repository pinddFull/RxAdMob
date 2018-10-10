//
//  GADUnifiedNativeAd+Rx.swift
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

extension Reactive where Base: GADUnifiedNativeAd {

    // Wrapper for `headline` property.
    public var headline: Observable<String?> {
        return self.observeWeakly(String.self, "headline")
    }

    // Wrapper for `callToAction` property.
    public var callToAction: Observable<String?> {
        return self.observeWeakly(String.self, "callToAction")
    }

    // Wrapper for `icon` property.
    public var icon: Observable<GADNativeAdImage?> {
        return self.observeWeakly(GADNativeAdImage.self, "icon")
    }

    // Wrapper for `body` property.
    public var body: Observable<String?> {
        return self.observeWeakly(String.self, "body")
    }

    // Wrapper for `images` property.
    public var images: Observable<[GADNativeAdImage]?> {
        return self.observeWeakly([GADNativeAdImage].self, "images")
    }

    // Wrapper for `starRating` property.
    public var starRating: Observable<NSDecimalNumber?> {
        return self.observeWeakly(NSDecimalNumber.self, "starRating")
    }

    // Wrapper for `store` property.
    public var store: Observable<String?> {
        return self.observeWeakly(String.self, "store")
    }

    // Wrapper for `price` property.
    public var price: Observable<String?> {
        return self.observeWeakly(String.self, "price")
    }

    // Wrapper for `advertiser` property.
    public var advertiser: Observable<String?> {
        return self.observeWeakly(String.self, "advertiser")
    }

    // Wrapper for `videoController` property.
    public var videoController: Observable<GADVideoController?> {
        return self.observeWeakly(GADVideoController.self, "videoController")
    }

    // Wrapper for `rootViewController` property.
    public var rootViewController: Observable<UIViewController?> {
        return self.observeWeakly(UIViewController.self, "rootViewController")
    }

    // Wrapper for `extraAssets` property.
    public var extraAssets: Observable<[String : Any]?> {
        return self.observeWeakly([String : Any].self, "extraAssets")
    }

    // Wrapper for `adNetworkClassName` property.
    public var adNetworkClassName: Observable<String?> {
        return self.observeWeakly(String.self, "adNetworkClassName")
    }

    // DelegateProxy Wrapper for delegate methods
    public var delegate: RxGADUnifiedNativeAdDelegate {
        return RxGADUnifiedNativeAdDelegateProxy.proxy(for: base)
    }

    private func nativeAd(_ arg: [Any]) throws -> GADUnifiedNativeAd {
        return try castOrThrow(GADUnifiedNativeAd.self, arg[0])
    }

    // Wrapper for method `nativeAdDidRecordImpression(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdDidRecordImpression: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdDidRecordImpression)
            .map(nativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `nativeAdDidRecordClick(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdDidRecordClick: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdDidRecordClick)
            .map(nativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `nativeAdWillPresentScreen(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdWillPresentScreen: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdWillPresentScreen)
            .map(nativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `nativeAdWillDismissScreen(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdWillDismissScreen: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdWillDismissScreen)
            .map(nativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `nativeAdDidDismissScreen(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdDidDismissScreen: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdDidDismissScreen)
            .map(nativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `nativeAdWillLeaveApplication(_ nativeAd: GADUnifiedNativeAd)`.
    public var nativeAdWillLeaveApplication: ControlEvent<GADUnifiedNativeAd> {
        let events = delegate.methodInvoked(.nativeAdWillLeaveApplication)
            .map(nativeAd)

        return ControlEvent(events: events)
    }
}
