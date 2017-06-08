//
//  DispatchQueueExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import Foundation

public extension DispatchQueue {
    
    public func asyncAfter(delay: DispatchTimeInterval, execute work: @escaping @convention(block) () -> Swift.Void) {
        asyncAfter(deadline: .now() + delay, execute: work)
    }
    
    public func asyncAfter(delay seconds: TimeInterval, execute work: @escaping @convention(block) () -> Swift.Void) {
        asyncAfter(deadline: .now() + seconds, execute: work)
    }
    
    public func asyncAfter(delay: DispatchTimeInterval, execute: DispatchWorkItem) {
        asyncAfter(deadline: .now() + delay, execute: execute)
    }
    
    public func asyncAfter(delay seconds: TimeInterval, execute: DispatchWorkItem) {
        asyncAfter(deadline: .now() + seconds, execute: execute)
    }
}
