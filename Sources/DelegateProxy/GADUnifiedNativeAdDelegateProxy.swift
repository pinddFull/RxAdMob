//
//  GADUnifiedNativeAdDelegateProxy.swift
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

public typealias RxGADUnifiedNativeAdDelegate = DelegateProxy<GADUnifiedNativeAd, GADUnifiedNativeAdDelegate>

open class RxGADUnifiedNativeAdDelegateProxy: RxGADUnifiedNativeAdDelegate, DelegateProxyType, GADUnifiedNativeAdDelegate {

    public init(parentObject: GADUnifiedNativeAd) {
        super.init(parentObject: parentObject, delegateProxy: RxGADUnifiedNativeAdDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADUnifiedNativeAdDelegateProxy in
            RxGADUnifiedNativeAdDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADUnifiedNativeAd) -> GADUnifiedNativeAdDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: GADUnifiedNativeAdDelegate?, to object: GADUnifiedNativeAd) {
        object.delegate = delegate
    }
}
