//
//  DateExt.swift
//  YJExtensionsGather
///
//  Created by YJHou on 2016/9/7.
//  Copyright © 2016年 侯跃军 GitHub:https://github.com/YJManager/YJExtensions . All rights reserved.
//

import Foundation

public extension Date {
    
    public enum DateUnit {
        case year
        case month
        case day
        case hour
        case minute
        case second
    }
    
    /// 从日期字符串创建日期对象
    public init?(string: String, format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone = TimeZone.current) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        
        if let date = formatter.date(from: string) {
            self = date
        }else {
            return nil
        }
    }
    
    /// 将日期转换为指定格式的字符串
    public func string(format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone = TimeZone.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    /// 日期计算，返回当前日期加上指定单位值之后的日期，会自动进位或减位
    /// 返回计算后的新日期
    public func add(_ value: Int, _ unit: DateUnit) -> Date {
        
        let component = unit.componentValue()
        let calendar = Calendar.current
        var components = calendar.dateComponents(DateUnit.all(), from: self)
        components.timeZone = TimeZone.current
        
        if let oriValue = components.value(for: component) {
            components.setValue(oriValue + value, for: component)
        }
        let date = calendar.date(from: components)
        return date ?? self
    }
    
    /// 将指定单位设置为指定的值，返回修改后的新日期
    /// 如果设置的值大于当前单位的最大值或者小于最小值，会自动进位或减位
    public func set(_ unit: DateUnit, to value: Int) -> Date {
        let component = unit.componentValue()
        let calendar = Calendar.current
        var components = calendar.dateComponents(DateUnit.all(), from: self)
        components.timeZone = TimeZone.current
        components.setValue(value, for: component)
        
        let date = calendar.date(from: components)
        return date ?? self
    }
    
    /// 忽略精确时间（时／分／秒）的日期
    public var withoutTime: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.timeZone = TimeZone.current
        
        let date = calendar.date(from: components)
        return date ?? self
    }
    
    /// 某个单位的值
    public func unit(_ unit: DateUnit) -> Int {
        let component = unit.componentValue()
        let calendar = Calendar.current
        var components = calendar.dateComponents([component], from: self)
        components.timeZone = TimeZone.current
        return components.value(for: component) ?? 0
    }
    
    /// 周几，周日为0
    public var weekday: Int {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.weekday], from: self)
        components.timeZone = TimeZone.current
        return (components.weekday ?? 1) - 1
    }
}

public extension TimeZone {
    
    /// 中国时区(东8区)
    public static var china: TimeZone {
        return TimeZone(identifier: "Asia/Shanghai")!
    }
    
    // UTC 0 时区
    public static var zero: TimeZone {
        return TimeZone(abbreviation: "UTC")!
    }
    
}

fileprivate extension Date.DateUnit {
    fileprivate func componentValue() -> Calendar.Component {
        switch self {
        case .year: return .year
        case .month: return .month
        case .day: return .day
        case .hour: return .hour
        case .minute: return .minute
        case .second: return .second
        }
    }
    
    fileprivate static func all() -> Set<Calendar.Component> {
        return [.year, .month, .day, .hour, . minute, .second]
    }
}



public extension Locale {
    
    /// 中国地区
    public static var china: Locale {
        return Locale(identifier: "zh_Hans_CN")
    }
    
    /// 美国地区
    public static var usa: Locale {
        return Locale(identifier: "es_US")
    }
}
