platform :ios, '8.0'
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def depends
    pod 'RxSwift', '~> 4.3'
    pod 'RxCocoa', '~> 4.3'
    pod 'Google-Mobile-Ads-SDK', '~> 7.30.0'
end

target 'RxAdMob' do
    depends
end

target 'Example' do
    pod 'RxAdMob', '~> 0.1.2'
    depends
end
