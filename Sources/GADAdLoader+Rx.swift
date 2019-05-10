//
//  GADAdLoader+Rx.swift
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

public extension Reactive where Base: GADAdLoader {

    typealias AdLoaderWithError = (adLoader: GADAdLoader, error: Error)
    typealias AdLoaderWithNativeAd = (adLoader: GADAdLoader, nativeAd: GADUnifiedNativeAd)

    // Wrapper for `adUnitID` property
    var adUnitID: Observable<String> {
        return self.observeWeakly(String.self, "adUnitID").unwrap()
    }

    // Wrapper for `isLoading` property
    var isLoading: Observable<Bool> {
        return self.observeWeakly(Bool.self, "loading").unwrap()
    }

    // DelegateProxy Wrapper for delegate methods
    var delegate: DelegateProxy<GADAdLoader, GADAdLoaderDelegate> {
        return RxGADAdLoaderDelegateProxy.proxy(for: base)
    }

    // DelegateProxy Wrapper with nativeAd for delegate methods
    var nativeAdLoaderDelegate: DelegateProxy<GADAdLoader, GADUnifiedNativeAdLoaderDelegate> {
        return RxGADUnifiedNativeAdLoaderDelegateProxy.proxy(for: base)
    }

    private func adLoader(_ arg: [Any]) throws -> GADAdLoader {
        return try castOrThrow(GADAdLoader.self, arg[0])
    }

    private func adLoaderWithError(_ arg: [Any]) throws -> AdLoaderWithError {
        let adLoader = try castOrThrow(GADAdLoader.self, arg[0])
        let error = try castOrThrow(Error.self, arg[1])

        return (adLoader, error)
    }

    private func adLoaderWithNativeAd(_ arg: [Any]) throws -> AdLoaderWithNativeAd {
        let adLoader = try castOrThrow(GADAdLoader.self, arg[0])
        let nativeAd = try castOrThrow(GADUnifiedNativeAd.self, arg[1])

        return (adLoader, nativeAd)
    }

    // Wrapper for method `adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError)`.
    var adLoaderDidFailToReceiveAdWithError: ControlEvent<AdLoaderWithError> {
        let events = delegate.methodInvoked(.adLoaderDidFailToReceiveAdWithError)
            .map(adLoaderWithError)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd)`.
    var adLoaderDidReceiveUnifiedNativeAd: ControlEvent<AdLoaderWithNativeAd> {
        let events = nativeAdLoaderDelegate.methodInvoked(.adLoaderDidReceiveUnifiedNativeAd)
            .map(adLoaderWithNativeAd)

        return ControlEvent(events: events)
    }

    // Wrapper for method `adLoaderDidFinishLoading(_ adLoader: GADAdLoader)`.
    var adLoaderDidFinishLoading: ControlEvent<GADAdLoader> {
        let events = delegate.methodInvoked(.adLoaderDidFinishLoading)
            .map(adLoader)

        return ControlEvent(events: events)
    }
}
