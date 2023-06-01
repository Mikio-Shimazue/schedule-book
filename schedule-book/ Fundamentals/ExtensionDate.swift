//
//  ExtensionDate.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/19.
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
  
  /// 日付文字取得"yyyy年M月d日(EEEEEE)"
  /// - Returns: <#description#>
  func getDateString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar.current
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "yyyy年M月d日(EEEEEE)" //  <- 多言語の場合ここを言語別テーブルへ変更
    
    let formattedDate = dateFormatter.string(from: self)
    
    return formattedDate
  }

  /// 時刻文字取得"HH:mm"
  /// - Returns: <#description#>
  func getTimeString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar.current
    dateFormatter.locale = Locale.current
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.dateFormat = "HH:mm"
    
    let time = dateFormatter.string(from: self)

    return time
  }
  
  /// 加算した時間の文字列取得
  /// - Parameter addingTime: 加算する時間(秒）
  /// - Returns: 終了時刻(HH:mm)取得

  func getAddingTimeString(addingTime: Double) -> String {
    let endDate = addingTimeInterval(addingTime)
    return endDate.getTimeString()
  }
  
  
  /// 日付が同じかチェック
  /// - Parameter date: 比較対象のDate
  func isDate(date: Date) -> Bool {
    return Calendar.current.isDate( self,equalTo: date, toGranularity: .day)
  }
}
