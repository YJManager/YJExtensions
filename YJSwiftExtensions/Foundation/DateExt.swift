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
    
    /// StringDate-to-Date
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
    
    /// Date-to-String
    ///
    /// - Parameters:
    ///   - format: Default is yyyy-MM-dd HH:mm:ss
    ///   - timeZone: Default is current
    /// - Returns: string date
    public func string(format: String = "yyyy-MM-dd HH:mm:ss", timeZone: TimeZone = TimeZone.current) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = timeZone
        return formatter.string(from: self)
    }
    
    /// Date Calculation
    ///
    /// - Parameters:
    ///   - value: step
    ///   - unit: enum
    /// - Returns: new Date
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
    
    /// Setting Date
    ///
    /// - Parameters:
    ///   - unit: enum
    ///   - value: setp
    /// - Returns: new Date
    public func set(_ unit: DateUnit, to value: Int) -> Date {
        let component = unit.componentValue()
        let calendar = Calendar.current
        var components = calendar.dateComponents(DateUnit.all(), from: self)
        components.timeZone = TimeZone.current
        components.setValue(value, for: component)
        
        let date = calendar.date(from: components)
        return date ?? self
    }
    
    /// withoutTime(H:m:s)
    public var withoutTime: Date {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.year, .month, .day], from: self)
        components.timeZone = TimeZone.current
        
        let date = calendar.date(from: components)
        return date ?? self
    }
    
    /// Individual Value
    ///
    /// - Parameter unit: enum
    /// - Returns: value
    public func unit(_ unit: DateUnit) -> Int {
        let component = unit.componentValue()
        let calendar = Calendar.current
        var components = calendar.dateComponents([component], from: self)
        components.timeZone = TimeZone.current
        return components.value(for: component) ?? 0
    }
    
    /// weekday
    public var weekday: Int {
        let calendar = Calendar.current
        var components = calendar.dateComponents([.weekday], from: self)
        components.timeZone = TimeZone.current
        return (components.weekday ?? 1) - 1
    }
}

public extension TimeZone {
    
    /// china TimeZone
    public static var china: TimeZone {
        return TimeZone(identifier: "Asia/Shanghai")!
    }
    
    // UTC 0 TimeZone
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
    
    /// china Locale
    public static var china: Locale {
        return Locale(identifier: "zh_Hans_CN")
    }
    
    /// usa Locale
    public static var usa: Locale {
        return Locale(identifier: "es_US")
    }
}
