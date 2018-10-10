//
//  GADAdLoaderDelegateProxy.swift
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

public typealias RxGADAdLoaderDelegate = DelegateProxy<GADAdLoader, GADAdLoaderDelegate>

open class RxGADAdLoaderDelegateProxy: RxGADAdLoaderDelegate, DelegateProxyType, GADAdLoaderDelegate {

    // Require call method
    public func adLoader(_ adLoader: GADAdLoader, didFailToReceiveAdWithError error: GADRequestError) {}

    public init(parentObject: GADAdLoader) {
        super.init(parentObject: parentObject, delegateProxy: RxGADAdLoaderDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADAdLoaderDelegateProxy in
            RxGADAdLoaderDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADAdLoader) -> GADAdLoaderDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: GADAdLoaderDelegate?, to object: GADAdLoader) {
        object.delegate = delegate
    }
}
