#
#  Be sure to run `pod spec lint JRUIOC.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name         = "JRUtils_Swift"
  s.version      = "0.0.2"
  s.summary      = "__"
  s.description  = '工具集合 Swift'

  s.homepage     = "https://github.com/jiaren0204/JRUtils_Swift"
  s.license      = "MIT"
  s.author             = { "梁嘉仁" => "50839393@qq.com" }
  s.platform     = :ios, "11.0"

  s.source       = { :git => "https://github.com/jiaren0204/JRUtils_Swift.git", :tag => "0.0.2" }

  s.swift_version = '5.0'

  s.framework  = "UIKit", "Foundation", "CoreText"
  s.vendored_frameworks = "JRUtils_Swift/JRUtils_SwiftFramework.framework"

  s.subspec 'Extension' do |ss|
    ss.source_files = 'JRUtils_Swift/Classes/Extension/*.swift'
  end

  s.subspec 'Utils' do |ss|
    ss.source_files = 'JRUtils_Swift/Classes/Utils/*.swift'
  end
  
  s.subspec 'Define' do |ss|
    ss.dependency 'JRUtils_Swift/Utils'

    ss.source_files = 'JRUtils_Swift/Classes/Define/*.swift'
  end

  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
