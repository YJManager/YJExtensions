version = "0.0.1";

Pod::Spec.new do |s|
    s.name         = "YJExtensions"
    s.version      = version
    s.summary      = "简介"
    s.description      = <<-DESC
                        描述
                            DESC
    s.homepage     = "https://github.com/YJManager/YJExtensions.git"

    s.license      = { :type => "MIT", :file => "LICENSE" }

    s.author       = { "houmanager" => "houmanager@Hotmail.com" }
    s.platform     = :ios, "8.0"
    s.ios.deployment_target = "8.0"
    s.requires_arc = true
    s.frameworks = 'Foundation', 'UIKit', 'CoreData', 'QuartzCore', 'CoreLocation', 'MapKit'
    #s.library       = 'resolv.9'
    #s.libraries    = "libresolv.9.tbd"
    s.source       = { :git => "https://github.com/YJManager/YJExtensions.git", :tag => "#{version}", :submodules => true }
    s.public_header_files = 'YJExtensions/*.{swift}'
    s.source_files        = 'YJExtensions/*.{swift}'

    # UIKit 配置模块
    s.subspec 'UIKit' do |ss|
    # 1. UIApplication 配置模块
    ss.subspec 'UIApplication' do |sss|
        sss.source_files        = 'YJCategories/UIKit/UIApplication/*.{h,m}'
        sss.public_header_files = 'YJCategories/UIKit/UIApplication/*.{h}'
    end

    end

    # Foundation 配置模块
    s.subspec 'Foundation' do |ss|
    # 1. NSString 配置模块
    ss.subspec 'NSString' do |sss|
        sss.source_files        = 'YJCategories/Foundation/NSString/*.{h,m}'
        sss.public_header_files = 'YJCategories/Foundation/NSString/*.{h}'
    end

    end

    #s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
