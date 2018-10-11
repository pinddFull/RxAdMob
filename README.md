# RxAdMob
[![Travis CI](https://travis-ci.org/pinddFull/RxAdMob.svg?branch=master/)](https://travis-ci.org/pinddFull/RxAdMob)
![Swift 4.2](https://img.shields.io/badge/Swift-4.2-orange.svg?style=flat)
[![Version](https://img.shields.io/cocoapods/v/RxAdMob.svg?style=flat)](http://cocoapods.org/pods/RxAdMob)
[![Platform](https://img.shields.io/cocoapods/p/RxAdMob.svg?style=flat)](http://cocoapods.org/pods/RxAdMob)
[![License](https://img.shields.io/cocoapods/l/RxAdMob.svg?style=flat)](http://cocoapods.org/pods/RxAdMob)

RxAdMob is a [RxSwift](https://github.com/ReactiveX/RxSwift) wrapper for [GoogleAdMob](https://developers.google.com/admob/ios).

## Example Usages (For Interstitial Ads)
### Initalize Google AdMob
```swift
// Setup API Key on initialize mobile ads
GADMobileAds.configure(withApplicationID: "Your API Key")
```
### Setup
```swift
let interstitial = GADInterstitial(adUnitID: "Your UID")
interstitial.load(GADRequest())
```
### Observing properties
```swift
interstitial.rx.isReady
    .asDriver(onErrorJustReturn: false)
    .filter { $0 }
    .drive(onNext: { _ in
        interstitial.present(fromRootViewController: self)
    })
    .disposeBag(by: disposeBag)
```
### Delegates
```swift
interstitial.rx.interstitialDidDismissScreen
    .asDriver()
    .drive(onNext: { interstitial in
        interstitial.load(GADRequest())
    })
    .disposed(by: disposeBag)

interstitial.rx.interstitialDidReceiveAd
    .asDriver()
    .drive(onNext: { interstitial in
        print("Interstitial did receive ad")
    })
    .disposed(by: disposeBag)
```

## Installation
### CocoaPods
Add to `Podfile`:
```ruby
pod 'RxAdMob'
```


## Requirements
- Swift 4.2
- [RxSwift](https://github.com/ReactiveX/RxSwift) >= 4.3
- [RxCocoa](https://github.com/ReactiveX/RxSwift) >= 4.3


## Support
### GADAdLoader+Rx
```swift
public typealias AdLoaderWithError = (adLoader: GADAdLoader, error: Error)
public typealias AdLoaderWithNativeAd = (adLoader: GADAdLoader, nativeAd: GADUnifiedNativeAd)

// Observing Properties
public var adUnitID: Observable<String>
public var isLoading: Observable<Bool>

// Delegate Events
public var adLoaderDidFailToReceiveAdWithError: RxCocoa.ControlEvent<AdLoaderWithError>
public var adLoaderDidReceiveUnifiedNativeAd: RxCocoa.ControlEvent<AdLoaderWithNativeAd>
public var adLoaderDidFinishLoading: RxCocoa.ControlEvent<GADAdLoader>
```
### GADAdReward+Rx
```swift
// Observing Properties
public var type: Observable<String>
public var amount: Observable<NSDecimalNumber>
```
### GADBannerView+Rx
```swift
public typealias BannerViewWithError = (bannerView: GADBannerView, error: Error)

// Observing Properties
public var adUnitID: Observable<String?>
public var rootViewController: Observable<UIViewController?>
public var adSize: Observable<GADAdSize>
public var adNetworkClassName: Observable<String?>
public var adViewDidReceiveAd: ControlEvent<GADBannerView>

// Delegate Events
public var didFailToReceiveAdWithError: ControlEvent<BannerViewWithError>
public var adViewWillPresentScreen: ControlEvent<GADBannerView>
public var adViewWillDismissScreen: ControlEvent<GADBannerView>
public var adViewDidDismissScreen: ControlEvent<GADBannerView>
public var adViewWillLeaveApplication: ControlEvent<GADBannerView>
```
### GADInterstitial+Rx
```swift
public typealias InterstitialWithError = (interstitial: GADInterstitial, error: Error)

// Observing Properties
public var adUnitID: Observable<String?>
public var isReady: Observable<Bool>
public var hasBeenUsed: Observable<Bool>
public var adNetworkClassName: Observable<String?>

// Delegate Events
public var interstitialDidReceiveAd: ControlEvent<GADInterstitial>
public var didFailToReceiveAdWithError: ControlEvent<InterstitialWithError>
public var interstitialWillPresentScreen: ControlEvent<GADInterstitial>
public var interstitialWillDismissScreen: ControlEvent<GADInterstitial>
public var interstitialDidDismissScreen: ControlEvent<GADInterstitial>
public var interstitialWillLeaveApplication: ControlEvent<GADInterstitial>
``` 
### GADRewardBasedVideoAd+Rx
```swift
public typealias RewardBasedVideoAdWithReward = (rewardBasedVideoAd: GADRewardBasedVideoAd, reward: GADAdReward)
public typealias RewardBasedVideoAdWithError = (rewardBasedVideoAd: GADRewardBasedVideoAd, error: Error)

// Observing Properties
public var isReady: Observable<Bool>
public var adNetworkClassName: Observable<String?>
public var userIdentifier: Observable<String?>

// Delegate Events
public var didRewardUser: ControlEvent<RewardBasedVideoAdWithReward>
public var rewardBasedVideoAdDidReceive: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidOpen: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidStartPlaying: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidCompletePlaying: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidClose: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdWillLeaveApplication: ControlEvent<GADRewardBasedVideoAd>
public var didFailToLoadWithError: ControlEvent<RewardBasedVideoAdWithError>
```
### GADUnifiedNativeAd+Rx
```swift
public typealias RewardBasedVideoAdWithReward = (rewardBasedVideoAd: GADRewardBasedVideoAd, reward: GADAdReward)
public typealias RewardBasedVideoAdWithError = (rewardBasedVideoAd: GADRewardBasedVideoAd, error: Error)

// Observing Properties
public var isReady: Observable<Bool>
public var adNetworkClassName: Observable<String?>
public var userIdentifier: Observable<String?>

// Delegate Events
public var didRewardUser: ControlEvent<RewardBasedVideoAdWithReward>
public var rewardBasedVideoAdDidReceive: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidOpen: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidStartPlaying: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidCompletePlaying: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdDidClose: ControlEvent<GADRewardBasedVideoAd>
public var rewardBasedVideoAdWillLeaveApplication: ControlEvent<GADRewardBasedVideoAd>
public var didFailToLoadWithError: ControlEvent<RewardBasedVideoAdWithError>
```
### GADUnifiedNativeAdView+Rx
```swift
// Observing Properties
public var nativeAd: Observable<GADUnifiedNativeAd?>
public var headlineView: Observable<UIView?>
public var callToActionView: Observable<UIView?>
public var iconView: Observable<UIView?>
public var bodyView: Observable<UIView?>
public var storeView: Observable<UIView?>
public var priceView: Observable<UIView?>
public var imageView: Observable<UIView?>
public var starRatingView: Observable<UIView?>
public var advertiserView: Observable<UIView?>
public var mediaView: Observable<GADMediaView?>
public var adChoicesView: Observable<GADAdChoicesView?>
```

## License
MIT License
