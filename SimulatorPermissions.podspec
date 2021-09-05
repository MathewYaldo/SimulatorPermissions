#
# Be sure to run `pod lib lint SimulatorPermissions.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SimulatorPermissions'
  s.version          = '1.0.0'
  s.summary          = 'Grants permission for services such as calendar, contacts, microphone, etc for iOS simulators for the purpose of unit testing.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
'This library can be used to automatically grant permissions in the simulator for all services that need permissions such as camera, photos, calendar, reminders, etc. This is meant to help with unit testing certain parts of code that utilizes such services.'
                       DESC

  s.homepage         = 'https://github.com/MathewYaldo/SimulatorPermissions'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mathew Yaldo' => 'mathewyaldo1@gmail.com' }
  s.source           = { :git => 'https://github.com/MathewYaldo/SimulatorPermissions.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'
  s.source_files = 'Classes/**/*'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "12.0"
  }
  
  
  # s.resource_bundles = {
  #   'SimulatorPermissions' => ['SimulatorPermissions/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
