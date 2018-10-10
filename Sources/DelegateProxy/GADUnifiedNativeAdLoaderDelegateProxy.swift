//
//  GADUnifiedNativeAdLoaderDelegateProxy.swift
//  RxAdMob
//
//  Created by pinddddd on 08/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import GoogleMobileAds

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

public typealias RxGADUnifiedNativeAdLoaderDelegate = DelegateProxy<GADAdLoader, GADUnifiedNativeAdLoaderDelegate>

open class RxGADUnifiedNativeAdLoaderDelegateProxy: RxGADUnifiedNativeAdLoaderDelegate, DelegateProxyType, GADUnifiedNativeAdLoaderDelegate {

    // Require call method
    public func adLoader(_ adLoader: GADAdLoader, didReceive nativeAd: GADUnifiedNativeAd) {}
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {}

    public init(parentObject: GADAdLoader) {
        super.init(parentObject: parentObject, delegateProxy: RxGADUnifiedNativeAdLoaderDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADUnifiedNativeAdLoaderDelegateProxy in
            RxGADUnifiedNativeAdLoaderDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADAdLoader) -> GADUnifiedNativeAdLoaderDelegate? {
        return object.delegate as? GADUnifiedNativeAdLoaderDelegate
    }

    public static func setCurrentDelegate(_ delegate: GADUnifiedNativeAdLoaderDelegate?, to object: GADAdLoader) {
        object.delegate = delegate
    }
}
