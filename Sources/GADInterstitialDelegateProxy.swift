//
//  GADInterstitialDelegateProxy.swift
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

public typealias RxGADInterstitialDelegate = DelegateProxy<GADInterstitial, GADInterstitialDelegate>

open class RxGADInterstitialDelegateProxy: RxGADInterstitialDelegate, DelegateProxyType, GADInterstitialDelegate {

    public init(parentObject: GADInterstitial) {
        super.init(parentObject: parentObject, delegateProxy: RxGADInterstitialDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADInterstitialDelegateProxy in
            RxGADInterstitialDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADInterstitial) -> GADInterstitialDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: GADInterstitialDelegate?, to object: GADInterstitial) {
        object.delegate = delegate
    }
}
