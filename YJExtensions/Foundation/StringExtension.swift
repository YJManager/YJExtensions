//
//  StringExtension.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/6/4.
//  Copyright © 2017年 Houmanager Author'email:houmanager@Hotmail.com. All rights reserved.
//

import Foundation

extension String {
    
    // MARK:-- 讲汉语装换为拼音
    func chineseTransform2PinYin(chinese: String) -> String {
        
        let mutableString = NSMutableString(string: chinese) as CFMutableString
        if CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false) && CFStringTransform(mutableString, nil, kCFStringTransformStripCombiningMarks, false) {
            return mutableString as String
        }else{
            return ""
        }
    }
}
