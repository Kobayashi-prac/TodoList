//
//  CalenderUtil.swift
//  TodoList
//
//  Created by swiftUI on 2025/12/27.
//

import Foundation

class CalenderUtil {
    
    static let shared = CalenderUtil()
    private let myCalendar = Calendar(identifier: .gregorian)
    
    private init() {}
    
    /// 月初の日付を返す
    ///- Parameters:
    ///  - year: 表示するカレンダーの年
    ///  - month: 表示するカレンダーの月
    func getFirstDay(year: Int?, month: Int?) -> Date? {
        guard let year = year, let month = month else {
            return nil
        }
        let components = DateComponents(year: year, month: month, day: 1)
        let firstDay = myCalendar.date(from: components)
        return firstDay
    }
    
    /// 月初の曜日を返す
    ///- Parameters:
    ///  - firstDay: 月初の日付
    func getFirstWeekday(firstDay: Date?) -> Int {
        guard let firstDay = firstDay else {
            return .zero
        }
        let weekday = myCalendar.component(.weekday, from: firstDay)
        return weekday
    }
    
    /// dateを含む月の日数を返す
    ///- Parameters:
    ///  - date: 日数を取得したい月の日付
    func getDaysInMonth(date: Date?) -> Range<Int>? {
        guard let date = date else {
            return nil
        }
        let range = myCalendar.range(of: .day, in: .month, for: date)
        return range
    }
    
}
