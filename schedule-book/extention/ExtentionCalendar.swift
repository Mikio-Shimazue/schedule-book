//
//  ExtentionCalendar.swift
//  schedule-book
//
//  Created by 島Work on 2023/02/14.
//

import Foundation

public extension Calendar {
  /// Description
  /// - Parameter for: <#for description#>
  /// - Returns: <#description#>
  func startDayOfMonth(for date: Date) -> Date? {
    let comps = dateComponents([.month, .year], from: date)
    return self.date(from: comps)
  }

  /// 月の日数を取得
  /// - Parameter date: <#date description#>
  /// - Returns: <#description#>
  func daysInMonth(for date: Date) -> Int? {
    return range(of: .day, in: .month, for: date)?.count
  }
  
  /// 月の週数取得
  /// - Parameter date: <#date description#>
  /// - Returns: <#description#>
  func weeksInMonth(for date: Date) -> Int? {
    return range(of: .weekOfMonth, in: .month, for: date)?.count
  }
  
  func year(for date: Date) -> Int? {
    let comps = dateComponents([.year], from: date)
    return comps.year
  }
  func month(for date: Date) -> Int? {
    let comps = dateComponents([.month], from: date)
    return comps.month
  }
  func day(for date: Date) -> Int? {
    let comps = dateComponents([.day], from: date)
    return comps.day
  }
  func weekday(for date: Date) -> Int? {
    let comps = dateComponents([.weekday],from: date)
    return comps.weekday
  }
}
