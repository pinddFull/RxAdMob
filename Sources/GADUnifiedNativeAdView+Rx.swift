//
//  GADUnifiedNativeAdView+Rx.swift
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

extension Reactive where Base: GADUnifiedNativeAdView {

    // Wrapper for `nativeAd` property.
    public var nativeAd: Observable<GADUnifiedNativeAd?> {
        return self.observeWeakly(GADUnifiedNativeAd.self, "nativeAd")
    }

    // Wrapper for `headlineView` property.
    public var headlineView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "headlineView")
    }

    // Wrapper for `callToActionView` property.
    public var callToActionView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "callToActionView")
    }

    // Wrapper for `iconView` property.
    public var iconView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "iconView")
    }

    // Wrapper for `bodyView` property.
    public var bodyView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "bodyView")
    }

    // Wrapper for `storeView` property.
    public var storeView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "storeView")
    }

    // Wrapper for `priceView` property.
    public var priceView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "priceView")
    }

    // Wrapper for `imageView` property.
    public var imageView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "imageView")
    }

    // Wrapper for `starRatingView` property.
    public var starRatingView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "starRatingView")
    }

    // Wrapper for `advertiserView` property.
    public var advertiserView: Observable<UIView?> {
        return self.observeWeakly(UIView.self, "advertiserView")
    }

    // Wrapper for `mediaView` property.
    public var mediaView: Observable<GADMediaView?> {
        return self.observeWeakly(GADMediaView.self, "mediaView")
    }

    // Wrapper for `adChoicesView` property.
    public var adChoicesView: Observable<GADAdChoicesView?> {
        return self.observeWeakly(GADAdChoicesView.self, "adChoicesView")
    }
}
