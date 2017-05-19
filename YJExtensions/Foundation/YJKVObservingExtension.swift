//
//  YJKVObservingExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/5/19.
//  Copyright © 2017年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import Foundation

extension NSObject{

    private struct associatedKeys{
        static var safe_observersArray = "observers"
    }
    
    
    public var keyPathObservers: [[String : NSObject]]{
    
        
    }
    
    private var observers: [[String : NSObject]] {
        get {
            if let observers = objc_getAssociatedObject(self, &associatedKeys.safe_observersArray) as? [[String : NSObject]] {
                return observers
            } else {
                self.observers = [[String : NSObject]]()
                return observers
            }
        } set {
            objc_setAssociatedObject(self, &associatedKeys.safe_observersArray, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    public func safe_addObserver(observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        
        if observers.indexOf({ $0 == observerInfo }) == nil {
            observers.append(observerInfo)
            addObserver(observer, forKeyPath: keyPath, options: .New, context: nil)
        }
    }
    
    public func safe_removeObserver(observer: NSObject, forKeyPath keyPath: String) {
        let observerInfo = [keyPath : observer]
        if let index = observers.indexOf({ $0 == observerInfo}) {
            observers.removeAtIndex(index)
            removeObserver(observer, forKeyPath: keyPath)
        }
    }


}
