//
//  UITextFieldExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UITextField {
    
    public func setPlaceholderColor(_ color: UIColor) {
        
        if let string = self.placeholder {
            if string.characters.count > 0 {
                let attributedString = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : color])
                self.attributedPlaceholder = attributedString
            }
        } else if let string = self.attributedPlaceholder {
            if string.length > 0 {
                let attributedString = NSMutableAttributedString(attributedString: string)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: color, range: NSMakeRange(0, string.length))
                self.attributedPlaceholder = attributedString
            }
        }
    }
}
