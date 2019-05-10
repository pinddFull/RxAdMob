//
//  GADAdReward+Rx.swift
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

public extension Reactive where Base: GADAdReward {

    // Wrapper for `type` property.
    var type: Observable<String> {
        return self.observeWeakly(String.self, "type").unwrap()
    }

    // Wrapper for `amount` property
    var amount: Observable<NSDecimalNumber> {
        return self.observeWeakly(NSDecimalNumber.self, "amount").unwrap()
    }
}
