Pod::Spec.new do |spec|

  spec.name         = "RxAdMob"
  spec.version      = "0.1.0"
  spec.summary      = "RxSwift Wrapper on Google AdMob"

  spec.description  = <<-DESC
  RxAdMob is a RxSwift wrapper for Google AdMob.
                        DESC

  spec.homepage     = "https://github.com/pinddFull/RxAdMob"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "pinddfull" => "pinddfull@gmail.com" }
  spec.source       = { :git => "https://github.com/pinddFull/RxAdMob.git", :tag => spec.version.to_s }

  spec.source_files  = "Sources", "*.swift"

  spec.requires_arc = true

  spec.frameworks = 'Foundation'
  spec.dependency "RxSwift", "~> 4.3"
  spec.dependency "RxCocoa", "~> 4.3"
  spec.dependency "GoogleMobileAds", "~>7.34.0"

end
