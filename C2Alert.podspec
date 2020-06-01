#
# Be sure to run `pod lib lint C2Alert.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'C2Alert'
  s.version          = '0.1.1'
  s.summary          = 'C2Alert is a simple alert library with good and customizable design.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
C2Alert is a simple alert library with good and customizable design. It has small size but greatly serves on the purpose.
                       DESC

  s.homepage         = 'https://github.com/c2mInc/C2Alert'
  s.screenshots     = 'https://cdn.pbrd.co/images/H3jkuoO.gif', 'https://cdn.pbrd.co/images/H3jkk8H.gif', 'https://cdn.pbrd.co/images/H3jkL7X.gif', 'https://cdn.pbrd.co/images/H3jjN6h.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Connected2.me' => 'http://connected2.me' }
  s.source           = { :git => 'https://github.com/c2mInc/C2Alert.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/connected2me'

  s.ios.deployment_target = '9.0'

  s.source_files = 'C2Alert/Classes/**/*'
  
  s.resource_bundles = {
    'C2Alert' => ['C2Alert/Assets/**/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
