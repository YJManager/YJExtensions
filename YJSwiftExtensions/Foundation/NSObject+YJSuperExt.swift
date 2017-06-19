//
//  NSObject+YJSuperExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import Foundation

public extension NSObject {
    /// 获取去除了模块名称的类名
    internal class var classNameWithoutModule: String {
        let name = self.classForCoder().description()
        let compments = name.components(separatedBy: ".")
        return compments.last!
    }
}
