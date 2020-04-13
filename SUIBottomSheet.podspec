#
# Be sure to run `pod lib lint SUIBottomSheet.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

# Workaround for Cocoapods issue #7606
#post_install do |installer|
#    installer.pods_project.build_configurations.each do |config|
#        config.build_settings.delete('CODE_SIGNING_ALLOWED')
#        config.build_settings.delete('CODE_SIGNING_REQUIRED')
#    end
#end

Pod::Spec.new do |s|
  s.name             = 'SUIBottomSheet'
  s.version          = '0.1.1'
  s.summary          = 'Lightweight bottomSheet built with SwiftUI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    'The SUIBottomSheet is built with SwiftUI and allows developers to include a functional bottom sheet with multiple states inside of their application.'
                       DESC

  s.homepage         = 'https://github.com/ZainNadeem/SUIBottomSheet'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zain Nadeem' => 'zainlove@me.com' }
  s.source           = { :git => 'https://github.com/ZainNadeem/SUIBottomSheet.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Source/**/*'
  s.resource_bundles = { 'BottomSheet' => ['Source/BottomSheet.bundle/**'] }
  s.swift_version = '5.0'
  # s.resource_bundles = {
  #   'SUIBottomSheet' => ['SUIBottomSheet/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
