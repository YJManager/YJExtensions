version = "0.0.1";

Pod::Spec.new do |s|
s.name         = "YJSwiftExtensions"
s.version      = version
s.summary      = "简介"
s.description      = <<-DESC
YJSwiftExtensions is commonly used extensions of swift
DESC
s.homepage     = "https://github.com/YJManager/YJExtensions"

s.license      = { :type => "MIT", :file => "LICENSE" }

s.author       = { "houmanager" => "houmanager@Hotmail.com" }
s.platform     = :ios, "8.0"
s.ios.deployment_target = "8.0"
s.requires_arc = true
s.source       = { :git => "https://github.com/YJManager/YJExtensions.git", :tag => "#{version}", :submodules => true }
s.source_files        = 'YJSwiftExtensions/*.{swift}'

# UIKit 配置模块
s.subspec 'UIKit' do |ss|
ss.source_files        = 'YJSwiftExtensions/UIKit/*.{swift}'
end

# Foundation 配置模块
s.subspec 'Foundation' do |ss|
ss.source_files        = 'YJSwiftExtensions/Foundation/*.{swift}'
end
end
