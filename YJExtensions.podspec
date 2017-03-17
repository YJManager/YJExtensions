version = "0.0.5";

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
        s.library       = 'resolv.9'
        #s.libraries    = "libresolv.9.tbd"
        s.source       = { :git => "https://github.com/YJManager/YJExtensions.git", :tag => "#{version}", :submodules => true }
        s.public_header_files = 'YJCategories/*.{h}'
        s.source_files        = 'YJCategories/*.{h,m}'

# UIKit 配置模块
s.subspec 'UIKit' do |ss|
# 1. UIApplication 配置模块
ss.subspec 'UIApplication' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIApplication/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIApplication/*.{h}'
end

# 2. UIWindow 配置模块
ss.subspec 'UIWindow' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIWindow/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIWindow/*.{h}'
end

# 3. UIViewController 配置模块
ss.subspec 'UIViewController' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIViewController/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIViewController/*.{h}'
end

# 4. UIView 配置模块
ss.subspec 'UIView' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIView/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIView/*.{h}'
end

# 5. UITableView 配置模块
ss.subspec 'UITableView' do |sss|
sss.source_files        = 'YJCategories/UIKit/UITableView/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UITableView/*.{h}'
end

# 6. UITableViewCell 配置模块
ss.subspec 'UITableViewCell' do |sss|
sss.source_files        = 'YJCategories/UIKit/UITableViewCell/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UITableViewCell/*.{h}'
end

# 7. UILabel 配置模块
ss.subspec 'UILabel' do |sss|
sss.source_files        = 'YJCategories/UIKit/UILabel/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UILabel/*.{h}'
end

# 8. UIButton 配置模块
ss.subspec 'UIButton' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIButton/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIButton/*.{h}'
end

# 9. UIDevice 配置模块
ss.subspec 'UIDevice' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIDevice/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIDevice/*.{h}'
end

# 10. UINavigationController 配置模块
ss.subspec 'UINavigationController' do |sss|
sss.source_files        = 'YJCategories/UIKit/UINavigationController/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UINavigationController/*.{h}'
end

# 11. UIControl 配置模块
ss.subspec 'UIControl' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIControl/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIControl/*.{h}'
end

# 12. UIFont 配置模块
ss.subspec 'UIFont' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIFont/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIFont/*.{h}'
end

# 13. UINavigationBar 配置模块
ss.subspec 'UINavigationBar' do |sss|
sss.source_files        = 'YJCategories/UIKit/UINavigationBar/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UINavigationBar/*.{h}'
end

# 14. UIResponder 配置模块
ss.subspec 'UIResponder' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIResponder/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIResponder/*.{h}'
end

# 15. UIBezierPath 配置模块
ss.subspec 'UIBezierPath' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIBezierPath/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIBezierPath/*.{h}'
end

# 16. UIScrollView 配置模块
ss.subspec 'UIScrollView' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIScrollView/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIScrollView/*.{h}'
end

# 17. UIBarButtonItem 配置模块
ss.subspec 'UIBarButtonItem' do |sss|
sss.source_files        = 'YJCategories/UIKit/UIBarButtonItem/*.{h,m}'
sss.public_header_files = 'YJCategories/UIKit/UIBarButtonItem/*.{h}'
end

end

# Foundation 配置模块
s.subspec 'Foundation' do |ss|
# 1. NSString 配置模块
ss.subspec 'NSString' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSString/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSString/*.{h}'
end

# 2. NSArray 配置模块
ss.subspec 'NSArray' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSArray/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSArray/*.{h}'
end

# 3. NSDictionary 配置模块
ss.subspec 'NSDictionary' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSDictionary/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSDictionary/*.{h}'
end

# 4. NSBundle 配置模块
ss.subspec 'NSBundle' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSBundle/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSBundle/*.{h}'
end

# 5. NSData 配置模块
ss.subspec 'NSData' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSData/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSData/*.{h}'
end

# 6. NSIndexPath 配置模块
ss.subspec 'NSIndexPath' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSIndexPath/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSIndexPath/*.{h}'
end

# 7. NSNotificationCenter 配置模块
ss.subspec 'NSNotificationCenter' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSNotificationCenter/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSNotificationCenter/*.{h}'
end

# 8. NSURL 配置模块
ss.subspec 'NSURL' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSURL/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSURL/*.{h}'
end

# 8. NSDate 配置模块
ss.subspec 'NSDate' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSDate/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSDate/*.{h}'
end

# 9. NSDateFormatter 配置模块
ss.subspec 'NSDateFormatter' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSDateFormatter/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSDateFormatter/*.{h}'
end


# 10. NSFileManager 配置模块
ss.subspec 'NSFileManager' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSFileManager/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSFileManager/*.{h}'
end

# 11. NSTimer 配置模块
ss.subspec 'NSTimer' do |sss|
sss.source_files        = 'YJCategories/Foundation/NSTimer/*.{h,m}'
sss.public_header_files = 'YJCategories/Foundation/NSTimer/*.{h}'
end

end

#s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
