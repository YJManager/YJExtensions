//
//  UIViewController+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIViewController {

    /// 从 Storyboard 实例化视图控制器
    ///
    /// - Parameters:
    ///   - name: Storyboard 名称，不传默认为Main
    ///   - bunlde: Storyboard 所在的 Bundle 不传默认为 main bundle
    ///   - id: 视图控制器在 Storyboard 中的id，不传默认为类名
    public class func yj_fromSB(_ name: String? = nil, bunlde: Bundle? = nil, id: String? = nil) -> Self {
        let bundle = bunlde ?? Bundle.main
        let sbName = name ?? "Main"
        let sb = UIStoryboard(name: sbName, bundle: bundle)
        let identifier = id ?? classNameWithoutModule
        return sb.yj_loadViewController(identifier)
    }
    
    /// 从 Xib 文件创建视图控制器，nibName 为空时默认使用类名
    public class func yj_fromXib(_ nibName: String? = nil, bundle: Bundle? = nil) -> Self {
        let name = nibName ?? classNameWithoutModule
        return self.init(nibName: name, bundle: bundle)
    }
    
    /// 插入 ChildController
    func yj_insertChildController(_ childController: UIViewController, intoParentView parentView: UIView) {
        childController.willMove(toParentViewController: self)
        
        self.addChildViewController(childController)
        childController.view.frame = parentView.bounds
        parentView.addSubview(childController.view)
        
        childController.didMove(toParentViewController: self)
    }

}

/// 导航相关
public extension UIViewController {
    
    /**
     *  设置当前视图的导航条返回按钮标题
     *  @attention 只有使用默认返回按钮时有效
     */
    public var yj_navigationBackTitle: String? {
        get {
            if let previous = self.yj_previousNavigationContent {
                return previous.navigationItem.backBarButtonItem?.title
            }
            return nil
        }
        set {
            if let previous = self.yj_previousNavigationContent {
                previous.navigationItem.backBarButtonItem = UIBarButtonItem(title: newValue, style: .plain, target: nil, action: nil)
            }
        }
    }
    
    /// 获取导航控制器栈中前一个视图控制器，不存在时返回空
    public var yj_previousNavigationContent: UIViewController? {
        if let viewControllers = self.navigationController?.viewControllers,
            viewControllers.count >= 2 {
            let index = viewControllers.count - 2
            return viewControllers[index]
        }
        return nil
    }
    
    /**
     *  设置导航控制器栈中下一个视图的返回按钮标题
     *  @attention 不会改变当前返回按钮的标题
     */
    public var yj_nextNavigationBackTitle: String? {
        get {
            return self.navigationItem.backBarButtonItem?.title
        }
        set {
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: newValue, style: .plain, target: nil, action: nil)
        }
    }
}
