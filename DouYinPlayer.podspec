#
# Be sure to run `pod lib lint DouYinPlayer.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DouYinPlayer'
  s.version          = '0.1.3'
  s.summary          = 'DouYinPlayer - swift 4.2'

  s.description      = <<-DESC
  播放器： 1. 播放本地网络视频。 竖屏播放， 支持滑动， 鉴权。
                       DESC

  s.homepage         = 'https://github.com/shiliujiejie/DouYinPlayer'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shiliujiejie' => 'zzhu51499@gmail.com' }
  s.source           = { :git => 'https://github.com/shiliujiejie/DouYinPlayer.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'DouYinPlayer/Classes/**/*'
  s.swift_version = '4.2'
  
  s.resource_bundles = {
     'DouYinPlayer' => ['DouYinPlayer/Assets/*.png']
  }
  s.dependency 'SnapKit'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
