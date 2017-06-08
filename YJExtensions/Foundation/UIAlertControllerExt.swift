//
//  UIAlertControllerExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    public func addAction(title: String?, style: UIAlertActionStyle, handler: ((UIAlertAction)->())? = nil) {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        self.addAction(action)
    }
}
