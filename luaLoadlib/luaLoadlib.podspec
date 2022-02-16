#
# Be sure to run `pod lib lint paylib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'luaLoadlib'
  s.version          = '2020.08.19'
  s.summary          = 'A short description of luaLoadlib.'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/pfzq303/luaLoadlib'
  # s.screenshots     = 'www.example/Users/hqq/Documents/admin/code/luaLoadlib/luaLoadlib.podspec.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'pfzq303' => 'pfzq303' }
  s.source           = { :git => 'https://github.com/pfzq303/luaLoadlib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.source_files = 'luaLoad/*.h','luaLoadlib/Classes/**/*'
  s.vendored_libraries = 'luaLoad/*.a'

  s.public_header_files = 'luaLoad/**/*.h'
  s.requires_arc = false
  s.static_framework = true
  s.prefix_header_file = 'prefix.pch'
  s.libraries = "z"
  #s.frameworks = 'MediaPlayer', 'GameController'
end
