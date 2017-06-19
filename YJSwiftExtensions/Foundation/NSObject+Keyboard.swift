//
//  NSObject+Keyboard.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

/**
 *  键盘管理器，用于在键盘弹出或收起时调整相应视图，以保证相关内容始终可见
 *
 *  使用方法：
 *  1、将需要始终可见的视图放置于 UIScrollView 或其子类中
 *  2、设置合适的约束
 *  3、创建 HKKeyboardManager，并关联对应的约束和视图
 */

public extension UIViewController {
    
    /// 初始化键盘UI管理器
    ///
    /// - Parameters:
    ///   - constraint: 键盘UI变化时需要调整的约束
    ///   - viewToAdjust: 键盘变化时需要调整的视图
    public func setupKeyboardManager(withPositionConstraint constraint:NSLayoutConstraint, viewToAdjust:UIView) {
        let manager = KeyboardManager(withViewController: self, positionConstraint: constraint, viewToAdjust: viewToAdjust)
        self.keyboardManager = manager;
    }
    
    fileprivate struct AssociatedKeys {
        static var KeyboardManagerKey = "KeyboardManagerKey"
    }
    
    /// 键盘管理器
    public var keyboardManager: KeyboardManager? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.KeyboardManagerKey) as? KeyboardManager
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self, &AssociatedKeys.KeyboardManagerKey, newValue as KeyboardManager?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
}


open class KeyboardManager: NSObject {
    
    /**
     *  临时启用或关闭管理器
     */
    var enabled = true
    
    /**
     *  是否与键盘同时执行调整动画，默认为 YES。设置为 NO 后，将会在键盘显示之后再执行动画。
     */
    var animateAlongwithKeyboard = true
    
    
    fileprivate enum KeyboardStatus {
        case hidden
        case shown
        case showing
    }
    fileprivate var keyboardStatus = KeyboardStatus.hidden
    
    fileprivate weak var viewController: UIViewController!
    fileprivate weak var viewToAdjust: UIView!
    fileprivate weak var positionConstraint: NSLayoutConstraint!
    
    fileprivate var originalConstant: CGFloat
    fileprivate var originalBottomSpace: CGFloat = 0
    fileprivate var currentKeyboardHeight: CGFloat = 0
    
    init(withViewController viewController: UIViewController, positionConstraint: NSLayoutConstraint, viewToAdjust: UIView) {
        self.viewController = viewController
        self.viewToAdjust = viewToAdjust
        self.positionConstraint = positionConstraint
        self.originalConstant = positionConstraint.constant
        super.init()
        
        DispatchQueue.main.async {
            self.registerKeyboardEvents()
        }
    }
    
    deinit {
        notificationCenter.removeObserver(self)
    }
    
    fileprivate let notificationCenter = NotificationCenter.default
    
    // MARK: - Private Logics
    fileprivate func registerKeyboardEvents()
    {
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardDidShow), name: Notification.Name.UIKeyboardDidShow, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillChangeFrame), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    fileprivate func viewBottomSpace() -> CGFloat
    {
        var bottomOffSet: CGFloat = 0
        if let scrollView = self.viewToAdjust as? UIScrollView {
            bottomOffSet = scrollView.contentInset.bottom
            bottomOffSet = max(0, bottomOffSet)
        }
        return self.viewController.view.frame.size.height - self.viewToAdjust.frame.size.height - self.viewToAdjust.frame.origin.y + bottomOffSet;
    }
    
    
    @objc internal func keyboardWillShow(_ notification: Notification) {
        guard keyboardStatus == .hidden else {
            return
        }
        
        self.originalBottomSpace = viewBottomSpace();
        if (self.animateAlongwithKeyboard) {
            updateForKeyboard(withNotification: notification)
        }
        keyboardStatus = .showing
    }
    
    @objc internal func keyboardDidShow(_ notification: Notification) {
        guard keyboardStatus == .showing else {
            return
        }
        
        updateForKeyboard(withNotification: notification)
        keyboardStatus = .shown
    }
    
    @objc internal func keyboardWillChangeFrame(_ notification: Notification) {
        
        guard keyboardStatus != .hidden else {
            return
        }
        
        updateForKeyboard(withNotification: notification)
    }
    
    @objc internal func keyboardWillHide(_ notification: Notification) {
        guard keyboardStatus != .hidden else {
            return
        }
        if (enabled) {
            let userInfo = notification.userInfo!
            let timeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let option = UIViewAnimationOptions(rawValue: UInt(userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber))
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05, execute: {
                UIView.animate(withDuration: timeInterval, delay: 0, options:option, animations: {
                    self.positionConstraint.constant = self.originalConstant
                    self.viewController.view.layoutIfNeeded()
                }, completion: nil)
            })
            self.currentKeyboardHeight = 0;
        }
        keyboardStatus = .hidden
    }
    
    fileprivate func updateForKeyboard(withNotification notification: Notification) {
        if (enabled) {
            let userInfo = notification.userInfo!
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            let frameInView = self.viewController.view.convert(endFrame, from: viewController.view.window)
            var keyBoardHeight = self.viewController.view.frame.size.height - frameInView.origin.y
            keyBoardHeight = max(0, keyBoardHeight)
            
            let bottomSpace = self.originalBottomSpace;
            if (bottomSpace > keyBoardHeight) {
                return;
            }
            
            let offset = keyBoardHeight - bottomSpace;
            
            let timeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber).doubleValue
            let option = UIViewAnimationOptions(rawValue: UInt(userInfo[UIKeyboardAnimationDurationUserInfoKey] as! NSNumber))
            
            UIView.animate(withDuration: timeInterval, delay: 0, options:option, animations: {
                self.positionConstraint.constant = self.originalConstant + offset
                self.viewController.view.layoutIfNeeded()
            }, completion: nil);
            
            self.currentKeyboardHeight = keyBoardHeight;
        }
    }
}

