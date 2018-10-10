//
//  SelectorExtension.swift
//  RxAdMob
//
//  Created by pinddddd on 07/10/2018.
//  Copyright © 2018 Jihoon Jung. All rights reserved.
//

import GoogleMobileAds

extension Selector {

    /*
        GADRewardBasedVideoAdDelegate
     */
    static let rewardBasedVideoAdDidRewardUser = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAd(_:didRewardUserWith:))
    static let rewardBasedVideoAdDidReceive = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdDidReceive(_:))
    static let rewardBasedVideoAdDidOpen = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdDidOpen(_:))
    static let rewardBasedVideoAdDidStartPlaying = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdDidStartPlaying(_:))
    static let rewardBasedVideoAdDidCompletePlaying = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdDidCompletePlaying(_:))
    static let rewardBasedVideoAdDidClose = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdDidClose(_:))
    static let rewardBasedVideoAdWillLeaveApplication = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAdWillLeaveApplication(_:))
    static let rewardBaseViewAdDidFailToLoadWithError = #selector(GADRewardBasedVideoAdDelegate.rewardBasedVideoAd(_:didFailToLoadWithError:))

    /*
        GADBannerViewDelegate
     */
    static let adViewDidReceiveAd = #selector(GADBannerViewDelegate.adViewDidReceiveAd(_:))
    static let adViewdidFailToReceiveAdWithError = #selector(GADBannerViewDelegate.adView(_:didFailToReceiveAdWithError:))
    static let adViewWillPresentScreen = #selector(GADBannerViewDelegate.adViewWillPresentScreen(_:))
    static let adViewWillDismissScreen = #selector(GADBannerViewDelegate.adViewWillDismissScreen(_:))
    static let adViewDidDismissScreen = #selector(GADBannerViewDelegate.adViewDidDismissScreen(_:))
    static let adViewWillLeaveApplication = #selector(GADBannerViewDelegate.adViewWillLeaveApplication(_:))

    /*
        GADInterestitalDelegate
     */
    static let interstitialDidReceiveAd = #selector(GADInterstitialDelegate.interstitialDidReceiveAd(_:))
    static let intersitialDidFailToReceiveAdWithError = #selector(GADInterstitialDelegate.interstitial(_:didFailToReceiveAdWithError:))
    static let interstitialWillPresentScreen = #selector(GADInterstitialDelegate.interstitialWillPresentScreen(_:))
    static let interstitialWillDismissScreen = #selector(GADInterstitialDelegate.interstitialWillDismissScreen(_:))
    static let interstitialDidDismissScreen = #selector(GADInterstitialDelegate.interstitialDidDismissScreen(_:))
    static let interstitialWillLeaveApplication = #selector(GADInterstitialDelegate.interstitialWillLeaveApplication(_:))

    /*
        GADAdLoaderDelegate
     */
    static let adLoaderDidFinishLoading = #selector(GADAdLoaderDelegate.adLoaderDidFinishLoading(_:))
    static let adLoaderDidFailToReceiveAdWithError = #selector(GADAdLoaderDelegate.adLoader(_:didFailToReceiveAdWithError:))

    /*
        GADUnifiedNativeAdLoaderDelegate <GADAdLoaderDelegate>
     */
    static let adLoaderDidReceiveUnifiedNativeAd = #selector(GADUnifiedNativeAdLoaderDelegate.adLoader(_:didReceive:))


    /*
        GADUnifiedNativeAdDelegate
     */
    static let nativeAdDidRecordImpression = #selector(GADUnifiedNativeAdDelegate.nativeAdDidRecordImpression(_:))
    static let nativeAdDidRecordClick = #selector(GADUnifiedNativeAdDelegate.nativeAdDidRecordClick(_:))
    static let nativeAdWillPresentScreen = #selector(GADUnifiedNativeAdDelegate.nativeAdWillPresentScreen(_:))
    static let nativeAdWillDismissScreen = #selector(GADUnifiedNativeAdDelegate.nativeAdWillDismissScreen(_:))
    static let nativeAdDidDismissScreen = #selector(GADUnifiedNativeAdDelegate.nativeAdDidDismissScreen(_:))
    static let nativeAdWillLeaveApplication = #selector(GADUnifiedNativeAdDelegate.nativeAdWillLeaveApplication(_:))
}
