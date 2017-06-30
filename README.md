# YJExtensions
YJExtensions 常用扩展

##Example:
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

