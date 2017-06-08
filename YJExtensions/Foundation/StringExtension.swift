//
//  StringExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

// MARK: - RegEx 正则表达式验证
public extension String {
    /// 邮箱
    public var yj_regexEmail: String {
        return "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*"
    }
    
    /// 电话号码
    public var yj_regexPhone: String {
        return "^(([+])\\d{1,4})*(\\d{3,4})*\\d{7,8}(\\d{1,4})*$"
    }
    
    /// 手机号码
    public var yj_regexMobile: String {
        return "^(([+])\\d{1,4})*1[0-9][0-9]\\d{8}$"
    }
    
    /// 是否匹配正则表达式
    public func yj_regexMatch(_ regex: String) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
    
    /// 字符串是否是邮箱
    public var yj_isEmail: Bool {
        return yj_regexMatch(yj_regexEmail)
    }
    
    /// 是否是电话号码
    public var yj_isPhone: Bool {
        return yj_regexMatch(yj_regexPhone)
    }
    
    /// 是否是手机号码
    public var yj_isMobile: Bool {
        return yj_regexMatch(yj_regexMobile)
    }
    
    /// 是否是电话或者手机
    public var isPhoneOrMobile: Bool {
        return yj_isPhone || yj_isMobile
    }
}

// MARK: - URL 
public extension String {
    /// URL 编码
    public var yj_URLEncode: String? {
        let characterSet = CharacterSet(charactersIn: ":/?#[]@!$ &'()*+,;=\"<>%{}|\\^~`")
        return self.addingPercentEncoding(withAllowedCharacters: characterSet)
    }
    /// URL 解码
    public var yj_URLDecode: String? {
        return self.removingPercentEncoding
    }
}

// MARK: - Bounding Rect
public extension String {
    /// 计算字符串的大小，根据限定的高或者宽度，计算另一项的值
    public func yj_width(limitToHeight height: CGFloat, font: UIFont) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        return self.yj_size(limitToSize: size, font: font).width
    }
    
    public func yj_height(limitToWidth width: CGFloat, font: UIFont) -> CGFloat {
        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        return self.yj_size(limitToSize: size, font: font).width
    }
    
    public func yj_size(limitToSize size: CGSize, font: UIFont) -> CGSize {
        let string = self as NSString
        let rect = string.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName:font], context: nil)
        return rect.size
    }
}

// MARK: - Base64
public extension String {
    /// Base64 编码
    public var yj_base64Encode: String? {
        if let data = self.data(using: .utf8) {
            return data.base64EncodedString()
        }
        return nil
    }
    /// Base64解码
    public var yj_base64Decode: String? {
        
        if let data = Data(base64Encoded: self) {
            return String(data: data, encoding: .utf8)
        }
        return nil
    }
}

// MARK: - 拼音部分
public extension String {
    
    /// 拼音的类型
    public enum yj_PinyinType {
        case normal         // 默认类型，不带声调
        case withTone       // 带声调的拼音
        case firstLetter    // 拼音首字母
    }
    
    public func yj_chineseTransform2PinYin(_ type: yj_PinyinType = .normal) -> String {
        switch type {
        case .normal:
            return _normalPinyin()
        case .withTone:
            return _pinyinWithTone()
        case .firstLetter:
            return _pinyinFirstLetter()
        }
    }
    
    private func _pinyinWithTone() -> String {
        let nameRef = CFStringCreateMutableCopy(nil, 0, self as CFString!)
        CFStringTransform(nameRef, nil, kCFStringTransformMandarinLatin, false)
        return nameRef! as String
    }
    
    private func _normalPinyin() -> String {
        let nameRef = CFStringCreateMutableCopy(nil, 0, self as CFString!)
        CFStringTransform(nameRef, nil, kCFStringTransformMandarinLatin, false)
        CFStringTransform(nameRef, nil, kCFStringTransformStripDiacritics, false)
        return nameRef! as String
        /**
         let mutableString = NSMutableString(string: chinese) as CFMutableString
         if CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false) && CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, false) {
         return mutableString as String
         }else{
         return ""
         }
         */
    }
    
    private func _pinyinFirstLetter() -> String {
        let pinyinString = yj_chineseTransform2PinYin() as NSString
        return pinyinString.substring(to: 1)
    }
}
