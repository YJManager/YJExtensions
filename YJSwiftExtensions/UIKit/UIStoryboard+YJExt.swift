//
//  UIStoryboard+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    /// 获取 Main Storyboard
    public class var yj_main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    /// 根据名称从 MainBundle 中创建 Storyboard
    public convenience init(_ name: String) {
        self.init(name: name, bundle: nil)
    }
    
    /// 创建当前 sb 入口视图控制器的实例
    public var yj_initial: UIViewController? {
        return instantiateInitialViewController()
    }
    
    /// 从 storyboard 创建视图控制器 identifier 为空时默认使用类名
    public func yj_loadViewController<T: UIViewController>(_ identifier: String? = nil) -> T {
        let id = identifier ?? T.classNameWithoutModule
        return self.instantiateViewController(withIdentifier: id) as! T
    }
    
    /// 从 storyboard 加载控制器
    public static func yj_loadViewController(from storyboard: String, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
    /// 从 Main.storyboard 加载控制器
    public static func yj_loadViewControllerFromMain(_ identifier: String) -> UIViewController {
        return yj_loadViewController(from: "Main", identifier: identifier)
    }
}
