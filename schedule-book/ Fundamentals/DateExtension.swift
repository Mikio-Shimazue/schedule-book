//
//  DateExtension.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/22.
//

import Foundation

extension Date {
  /// M月d日(曜日）形式の文字列取得
  /// - Returns: 表題の形式文字列
  func getDateAndWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar.current
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "M月d日(EEEE)" //  <- 多言語の場合ここを言語別テーブルへ変更
    
    let formattedDate = dateFormatter.string(from: self)
    
    return formattedDate
  }
}
