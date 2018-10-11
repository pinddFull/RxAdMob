Pod::Spec.new do |spec|

  spec.name         = "RxAdMob"
  spec.version      = "0.1.3"
  spec.summary      = "RxSwift Wrapper on Google AdMob"
  spec.license      = "MIT"

  spec.description  = <<-DESC
  RxAdMob is a RxSwift wrapper for Google AdMob.
                        DESC

  spec.homepage     = "https://github.com/pinddFull/RxAdMob"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "pinddfull" => "pinddfull@gmail.com" }
  spec.source       = { :git => "https://github.com/pinddFull/RxAdMob.git", :tag => spec.version.to_s }

  spec.platform = :ios, "8.0"
  spec.ios.deployment_target = '8.0'

  spec.source_files  = "Sources", "*.swift"

  spec.swift_version = '4.2'

  spec.requires_arc = true
  spec.static_framework = true

  spec.frameworks = 'Foundation'
  spec.dependency "RxSwift", "~> 4.3"
  spec.dependency "RxCocoa", "~> 4.3"
  spec.dependency "Google-Mobile-Ads-SDK", "~> 7.30.0"

end
