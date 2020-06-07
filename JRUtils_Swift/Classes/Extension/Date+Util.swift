//
//  Date+Util.swift
//  JRUtils_Swift
//
//  Created by 梁嘉仁 on 2020/6/7.
//  Copyright © 2020 梁嘉仁. All rights reserved.
//

import Foundation

extension Date {
    
    public static func dateStrToDate(_ dateStr: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        return formatter.date(from: dateStr)
    }
    
    // MARK: 是否今天
    public func isToday() -> Bool {
        let calendar = Calendar.current
        let unit:Set<Calendar.Component> = [Calendar.Component.day, Calendar.Component.month, Calendar.Component.year]
        
        let nowCmps = calendar.dateComponents(unit, from: Date())
        let selfCmps = calendar.dateComponents(unit, from: self)
        
        return selfCmps.year == nowCmps.year && selfCmps.month == nowCmps.month && selfCmps.day == nowCmps.day
    }
    
    public func ymdhmStr() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd HH:mm"
        return formatter.string(from: self)
    }

}
