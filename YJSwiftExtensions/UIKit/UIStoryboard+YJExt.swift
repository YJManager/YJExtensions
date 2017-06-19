//
//  UIStoryboard+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIStoryboard {
    
    /// 从 storyboard 加载控制器
    public static func loadViewController(from storyboard: String, identifier: String) -> UIViewController {
        let uiStoryboard = UIStoryboard(name: storyboard, bundle: nil)
        return uiStoryboard.instantiateViewController(withIdentifier: identifier)
    }
    
    /// 从 Main.storyboard 加载控制器
    public static func loadViewControllerFromMain(_ identifier: String) -> UIViewController {
        return loadViewController(from: "Main", identifier: identifier)
    }
}
