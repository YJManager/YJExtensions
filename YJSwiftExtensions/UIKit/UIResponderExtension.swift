//
//  UIResponderExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIResponder {
    
    /// 解除任何可能存在的第一响应者
    public class func resignAnyFirstResponder() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// 用于在 IB 中指定移除第一响应者事件
    @IBAction public func autoResignFirstResponder() {
        resignFirstResponder()
    }
    
    /// 用于在 IB 中指定第一响应者事件
    @IBAction public func autoBecomFirstResponder() {
        becomeFirstResponder()
    }
    
}

