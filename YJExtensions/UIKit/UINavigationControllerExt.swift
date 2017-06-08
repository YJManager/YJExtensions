//
//  UINavigationControllerExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

extension UINavigationController {
    /// 替换当前导航控制器栈顶的视图
    open func replaceTop(with viewController: UIViewController, animated: Bool = true) {
        var vcs = self.viewControllers
        vcs.removeLast()
        vcs.append(viewController)
        setViewControllers(vcs, animated: animated)
    }
    
    /// 简化 push 函数
    open func push(_ viewController: UIViewController, animated: Bool = true) {
        pushViewController(viewController, animated: animated)
    }
    
    /// 简化 pop 函数，且不强制要求接收返回值
    @discardableResult open func pop(animated: Bool = true) -> UIViewController? {
        return popViewController(animated: animated)
    }
}
