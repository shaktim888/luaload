#
# Be sure to run `pod lib lint luaLoad.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'luaLoad'
  s.version          = '0.1.0'
  s.summary          = 'A short description of luaLoad.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/admin@qq.com/luaLoad'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'admin@qq.com' => 'admin@qq.com' }
  s.source           = { :git => 'https://github.com/admin@qq.com/luaLoad.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'luaLoad/Classes/**/*'

  s.public_header_files = 'luaLoad/Classes/ZipLoader.h'
  
  build_a_script = <<-EOF
  FMK_NAME=${PROJECT_NAME}
  if [ "${ACTION}" = "build" ]
    then
    INSTALL_DIR=${SRCROOT}/Products/luaLoad
    DEVICE_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphoneos/luaLoad
    SIMULATOR_DIR=${BUILD_ROOT}/${CONFIGURATION}-iphonesimulator/luaLoad
    
    # -configuration ${CONFIGURATION}
    # Clean and Building both architectures.
    #xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphoneos clean build
    #xcodebuild -configuration "Release" -target "${FMK_NAME}" -sdk iphonesimulator clean build
    
    if [ -d "${INSTALL_DIR}" ]
      then
      rm -rf "${INSTALL_DIR}"
      fi
      mkdir -p "${INSTALL_DIR}"
      cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
      #ditto "${DEVICE_DIR}/Headers" "${INSTALL_DIR}/Headers"
      lipo -create "${DEVICE_DIR}/libluaLoad.a" "${SIMULATOR_DIR}/libluaLoad.a" -output "${INSTALL_DIR}/libluaLoad.a"
      #这个是合并完成后打开对应的文件夹，你就可以直接看到文件了
      #open "${SRCROOT}/Products/luaLoad"
    fi
  EOF
  s.script_phase = { :name => 'rebuild_a', :script => build_a_script, :execution_position => :after_compile }
  
  s.libraries = "z"
  # s.resource_bundles = {
  #   'luaLoad' => ['luaLoad/Assets/*.png']
  # }
  s.prefix_header_file = 'luaLoad/Classes/prefix.pch'
  s.requires_arc = false
  s.static_framework = true
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
