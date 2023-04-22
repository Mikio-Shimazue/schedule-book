//
//  ExtentionDate.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/19.
//

import Foundation

extension Date {
  func getTimeString() -> String? {
    let formatter = DateFormatter()
    formatter.locale = Locale.current
    formatter.timeZone = TimeZone.current
    formatter.dateFormat = "HH:mm"
    
    return formatter.string(from: self)
  }
}
