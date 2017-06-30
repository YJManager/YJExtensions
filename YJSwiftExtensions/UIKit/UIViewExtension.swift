//
//  UIViewExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit


public extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = self.layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
}

public extension Bundle {
    /// 从 xib 文件创建视图
    ///
    /// - Parameter name: xib 文件名，默认为指定视图类名
    public func createView<T: UIView>(_ name: String? = nil, owner: Any? = nil, options: [AnyHashable : Any]? = nil) -> T {
        let nibName = name ?? T.classNameWithoutModule
        let view = loadNibNamed(nibName, owner: owner, options: options)![0] as! T
        return view
    }
}

extension NSObject {
    /// 获取去除了模块名称的类名
    internal class var classNameWithoutModule: String {
        let name = self.classForCoder().description()
        let compments = name.components(separatedBy: ".")
        return compments.last!
    }
}
