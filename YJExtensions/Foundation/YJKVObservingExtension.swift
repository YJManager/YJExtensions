//
//  YJKVObservingExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import Foundation

extension NSObject{

    private struct kAssociatedKeys{
        static var safe_ObserversKey = "observers"
    }
    
    /** 开辟保存对象的监听对象们 */
    public var keyPathObservers: [[String : NSObject]]{
        get{
            if let observers = objc_getAssociatedObject(self, &kAssociatedKeys.safe_ObserversKey) as? [[String : NSObject]] {
                return observers
            } else {
                self.keyPathObservers = [[String : NSObject]]()
                return self.keyPathObservers
            }
        } set {
            objc_setAssociatedObject(self, &kAssociatedKeys.safe_ObserversKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /** 安全添加监听对象 */
    public func yj_addSafeObserver(observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath: observer]
        
        if self.keyPathObservers.contains(where: { (element) -> Bool in
            if element == observerInfo{
                return true
            }else{
                return false
            }
        }) { // 包含
        }else{ // 添加
            self.keyPathObservers.append(observerInfo)
            addObserver(observer, forKeyPath: keyPath, options: .new, context: nil)
        }
    }
    
    /** 安全移除监听对象 */
    public func yj_removeSafeObserver(observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath: observer]
        if self.keyPathObservers.contains(where: { (element) -> Bool in
            if element == observerInfo{
                return true
            }else{
                return false
            }
        }) { // 包含
   
            if let index = self.keyPathObservers.index(where: { (element) -> Bool in
                if element == observerInfo{
                    return true
                }else{
                    return false
                }
            }) { // 安全移除
                self.keyPathObservers.remove(at: index)
                removeObserver(observer, forKeyPath: keyPath)
                
            }
        }
    }
    
    /** 移除所有的监听*/
    public func yj_removeAllSafeObservers() {
        for element: [String : NSObject] in self.keyPathObservers {
            let observerInfo = element
            if let keyPath = observerInfo.keys.first, let observer = observerInfo.values.first{
                removeObserver(observer, forKeyPath: keyPath)
            }
        }
        keyPathObservers.removeAll()
    }
}
