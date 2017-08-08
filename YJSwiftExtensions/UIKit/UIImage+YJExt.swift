//
//  UIImage+YJExt.swift
//  YJExtensionsGather
//
//  Created by YJHou on 2017/6/30.
//  Copyright © 2017年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import UIKit

public extension UIImage {
    
    /// 颜色生成图片
    public static func yj_createImage(_ color: UIColor) -> UIImage? {
        
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? nil
    }

}


enum WidthType {
    case small(minValue: CGFloat, maxValue: CGFloat)
    case middle(minValue: CGFloat, maxValue: CGFloat)
    case large(minValue: CGFloat, maxValue: CGFloat)
    case giant(minValue: CGFloat, maxValue: CGFloat)
    
    init(minV: CGFloat, maxV: CGFloat) {
        switch maxV {
        case 0..<1664:
            self = .small(minValue: minV, maxValue: maxV)
        case 1664..<4990:
            self = .middle(minValue: minV, maxValue: maxV)
        case 4990..<10240:
            self = .large(minValue: minV, maxValue: maxV)
        default:
            self = .giant(minValue: minV, maxValue: maxV)
        }
    }
    
    var size: (minV: CGFloat, maxV: CGFloat, size: CGFloat) {
        switch self {
        case .small(let minV, let maxV):
            return (minV: minV, maxV: maxV, size: max(60, minV * maxV / pow(1664, 2) * 150))
        case .middle(let minV, let maxV):
            return (minV: minV / 2, maxV: maxV / 2, size: max(60, ((minV / 2) * (maxV / 2)) / pow(4990 / 2, 2) * 300))
        case .large(let minV, let maxV):
            return (minV: minV / 4, maxV: maxV / 4, size: max(100, ((minV / 4) * (maxV / 4)) / pow(10240 / 4, 2) * 300))
        case .giant(let minV, let maxV):
            let multiple = ((maxV / 1280) == 0) ? 1 : (maxV / 1280)
            return (minV: minV / multiple, maxV: maxV / multiple, size: max(100, ((minV / multiple) * (maxV / multiple)) / pow(2560, 2) * 300))
        }
    }
}

enum SizeType {
    case square(minValue: CGFloat, maxValue: CGFloat)
    case rectangle(minValue: CGFloat, maxValue: CGFloat)
    case other(minValue: CGFloat, maxValue: CGFloat)
    
    init?(size: CGSize) {
        let minV = min(size.width, size.height)
        let maxV = max(size.width, size.height)
        
        let ratio = minV / maxV
        
        if ratio > 0 && ratio <= 0.5 {
            // [1:1 ~ 9:16)
            self = .square(minValue: minV, maxValue: maxV)
        } else if ratio > 0.5 && ratio < 0.5625 {
            // [9:16 ~ 1:2)
            self = .other(minValue: minV, maxValue: maxV)
        } else if ratio >= 0.5625 && ratio <= 1 {
            // [1:2 ~ 1:∞)
            self = .rectangle(minValue: minV, maxValue: maxV)
        } else {
            return nil
        }
    }
    
    var size: (minV: CGFloat, maxV: CGFloat, size: CGFloat) {
        switch self {
        case .square(let minV, let maxV):
            let widthType = WidthType.init(minV: minV, maxV: maxV)
            return widthType.size
        case .rectangle(let minV, let maxV):
            let multiple = ((maxV / 1280) == 0) ? 1 : (maxV / 1280)
            let size = max(100, ((minV / multiple) * (maxV / multiple)) / (1440 * 2560) * 400)
            return (minV: minV / multiple, maxV: maxV / multiple, size: size)
        case .other(let minV, let maxV):
            let ratio = minV / maxV
            let multiple = CGFloat(ceilf(Float(maxV / (1280 / ratio))))
            let size = max(100, ((minV / multiple) * (maxV / multiple)) / (1280 * (1280 / ratio)) * 500)
            return (minV: minV / multiple, maxV: maxV / multiple, size: size)
        }
    }
}

public extension UIImage {
    
    /// 压缩image
    ///
    /// - Returns: 压缩以后的
    public func compressedImage() -> UIImage {
        if let imgData = UIImageJPEGRepresentation(self, 1) {
            let imgFileSize = imgData.count
            print("origin file size: \(imgFileSize)")
            
            if let type = SizeType.init(size: self.size) {
                let compressSize = type.size.size
                let resizedImage = resizeTo(size: CGSize(width: type.size.minV, height: type.size.maxV))
                if let data = resizedImage.compressTo(size: compressSize) {
                    print("compressed file size: \(data.count)")
                    return UIImage(data: data) ?? self
                }
            }
        }
        return self
    }
    
    
    /// 压缩大小
    ///
    /// - Returns: 压缩后的data
    public func compressedData() -> Data? {
        if let imgData = UIImageJPEGRepresentation(self, 1) {
            let imgFileSize = imgData.count
            print("origin file size: \(imgFileSize)")
            
            if let type = SizeType.init(size: self.size) {
                let compressSize = type.size.size
                let resizedImage = resizeTo(size: CGSize(width: type.size.minV, height: type.size.maxV))
                if let data = resizedImage.compressTo(size: compressSize) {
                    print("compressed file size: \(data.count)")
                    return data
                }
            }
        }
        return nil
    }
    
    
    /// 重设大小
    ///
    /// - Parameter size: 参数大小
    /// - Returns: 调整后
    public func resizeTo(size: CGSize) -> UIImage {
        let ratio = self.size.height / self.size.width
        var factor: CGFloat = 1.0
        if ratio > 1 {
            factor = size.height / size.width
        } else {
            factor = size.width / size.height
        }
        let toSize = CGSize(width: self.size.width * factor, height: self.size.height * factor)
        
        UIGraphicsBeginImageContext(toSize)
        draw(in: CGRect.init(origin: CGPoint(x: 0, y: 0), size: toSize))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image ?? self
    }
    
    /// 压缩大小
    ///
    /// - Parameter size: 参数大小
    /// - Returns: 压缩后的data
    public func compressTo(size: CGFloat) -> Data? {
        var compression: CGFloat = 1.0
        let maxCompression: CGFloat = 0.1
        guard var data = UIImageJPEGRepresentation(self, compression) else {
            return nil
        }
        while CGFloat(data.count) > size && compression > maxCompression {
            compression -= 0.1
            if let temp = UIImageJPEGRepresentation(self, compression) {
                data = temp
            } else {
                return data
            }
        }
        return data
    }
}

