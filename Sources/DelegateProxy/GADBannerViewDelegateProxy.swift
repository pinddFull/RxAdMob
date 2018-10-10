//
//  GADBannerViewDelegateProxy.swift
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

public typealias RxGADBannerViewDelegate = DelegateProxy<GADBannerView, GADBannerViewDelegate>

open class RxGADBannerViewDelegateProxy: RxGADBannerViewDelegate, DelegateProxyType, GADBannerViewDelegate {

    public init(parentObject: GADBannerView) {
        super.init(parentObject: parentObject, delegateProxy: RxGADBannerViewDelegateProxy.self)
    }

    public static func registerKnownImplementations() {
        self.register { parent -> RxGADBannerViewDelegateProxy in
            RxGADBannerViewDelegateProxy(parentObject: parent)
        }
    }

    public static func currentDelegate(for object: GADBannerView) -> GADBannerViewDelegate? {
        return object.delegate
    }

    public static func setCurrentDelegate(_ delegate: GADBannerViewDelegate?, to object: GADBannerView) {
        object.delegate = delegate
    }
}
