# YJExtensions

[![Language](https://img.shields.io/badge/Language-Swift%203.0%2B-FF8247.svg?style=flat)](https://github.com/YJManager/YJExtensions.git)
[![CocoaPods](https://img.shields.io/cocoapods/p/YJSwiftExtensions.svg)](https://github.com/YJManager/YJExtensions.git)
[![CocoaPods](https://img.shields.io/cocoapods/v/YJSwiftExtensions.svg)](https://github.com/YJManager/YJExtensions.git)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/YJManager/YJExtensions.git)
[![GitHub tag](https://img.shields.io/github/tag/YJManager/YJExtensions.svg)](https://github.com/YJManager/YJExtensions.git)
[![license](https://img.shields.io/github/license/YJManager/YJExtensions.svg)](https://github.com/YJManager/YJExtensions.git)

YJExtensions 常用扩展集合

## Adding YJSwiftExtensions to your project (添加 YJSwiftExtensions 到你的项目)

### CocoaPods

1. Add a pod entry for `YJSwiftExtensions` to your Podfile </br>
```bash
    pod 'YJSwiftExtensions'
```
2. Install the pod(s) by running </br>
```bash
    pod install
```
3. Include `YJSwiftExtensions` wherever you need it with </br>
```bash
    import YJSwiftExtensions
```

### Carthage

1. Add YJSwiftExtensions to your Cartfile. </br>
```bash
    github "YJManager/YJSwiftExtensions
```
2. Run 
```bash
    carthage update
```
3. Follow the rest of the [standard Carthage installation instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add YJSwiftExtensions to your project.

## Example举例:

由颜色生成图片
```swift
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
```

