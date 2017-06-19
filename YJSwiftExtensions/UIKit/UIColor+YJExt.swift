//
//  UIColor+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIColor {
    
    /// rgba
    public static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: a)
    }
    
    /// rgb
    public static func rgb(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat) -> UIColor {
        return rgba(r, g, b, 1.0)
    }
    
    /**
     *  使用16进制字符串创建颜色
     *
     *  @param hexString 16进制字符串，可以是 0XFFFFFF/#FFFFFF/FFFFFF 三种格式之一
     *
     *  @return 返回创建的UIColor对象
     */
    public convenience init?(_ hexString: String, alpha: CGFloat = 1) {
        
        let characterSet = CharacterSet.whitespacesAndNewlines
        var string = hexString.trimmingCharacters(in: characterSet).uppercased()
        
        if string.characters.count < 6 {
            return nil
        }
        
        if string.hasPrefix("0X") {
            let ns = string as NSString
            string = ns.substring(from: 2)
        }
        if string.hasPrefix("#") {
            let ns = string as NSString
            string = ns.substring(from: 1)
        }
        
        if string.characters.count != 6 {
            return nil
        }
        
        let colorString = string as NSString
        var range = NSMakeRange(0, 2)
        
        let rString = colorString .substring(with: range)
        
        range.location += 2
        let gString = colorString.substring(with: range)
        
        range.location += 2
        let bString = colorString.substring(with: range)
        
        var r: UInt32 = 0
        var g: UInt32 = 0
        var b: UInt32 = 0
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    /// 随机颜色颜色
    public static func yj_randomColor() -> UIColor{
        let randomColor = UIColor(colorLiteralRed: Float(arc4random() % 255) / 255.0, green: Float(arc4random() % 255) / 255.0, blue: Float(arc4random() % 255) / 255.0, alpha: 1)
        return randomColor
    }
}

