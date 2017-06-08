//
//  YJBundleExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/6/8.
//  Copyright © 2017年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import Foundation

public extension Bundle{
    /// 获取应用程序资源包下的路径
    ///
    /// - Parameters:
    ///   - name: 资源名称
    /// - Returns: 返回资源路径
    public func yj_resourcePath(_ name: String) -> String? {
        let path = name as NSString
        let pathExtension = path.pathExtension
        var nameWithoutExtension = name
        if pathExtension.characters.count > 0{
            nameWithoutExtension = path.deletingPathExtension
        }
        let string = self.path(forResource: nameWithoutExtension, ofType: pathExtension)
        return string == nil ? nil : string!
    }
}

