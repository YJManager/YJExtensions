//
//  UINib+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UINib {
    
    /// 根据 nibName 获取nib
    public static func yj_nib(named nibName: String) -> UINib {
        return UINib(nibName: nibName, bundle: nil)
    }
    
    /// 从nib 获取 View
    public static func yj_loadSingleView(nibName: String, owner: Any?) -> UIView? {
        let views = yj_nib(named: nibName).instantiate(withOwner: owner, options: nil)
        if views.count > 0 {
            return views[0] as? UIView
        }
        return nil
    }
}
