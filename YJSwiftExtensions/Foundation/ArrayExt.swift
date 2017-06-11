//
//  ArrayExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/11.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import Foundation

public extension Array {
    
    /// 可变数组移除第一个元素
    public mutating func yj_removeFirst() {
        if !self.isEmpty {
            self.removeFirst()
        }
    }
    
    /// 可变数组移除最后一个元素
    public mutating func yj_removeLast() {
        if !self.isEmpty {
            self.removeLast()
        }
    }

    

}
