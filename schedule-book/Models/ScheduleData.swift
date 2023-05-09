//
//  ScheduleData.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/19.
//

import Foundation
import SwiftUI

class ScheduleData: Identifiable {
  /// 開始日時
  var startTime: Date?
  /// 予定時間（分)
  var duration: Double?
  /// 予定情報
  var information: String?
  /// 通知時刻
  var alarm: Date?
  /// 文字色（デフォルト：黒）
  var color: Color = Color.black
  
  init(startTime: Date? = nil, duration: Double? = nil, information: String? = nil) {
    self.startTime = startTime
    self.duration = duration
    self.information = information
  }
  
  func getTitleString() -> String? {
    if 10 < (information?.count ?? 0) {
      let str = information!.prefix(10) + "..."
      return String(str)
    }
    return information
  }
  /// 開始時刻（String）取得
  /// - Returns: 開始時刻(HH:mm)取得
  func getStartTimeString() -> String? {
    return startTime?.getTimeString()
  }
  
  /// 終了時刻(String)取得
  /// - Returns: 終了時刻(HH:mm)取得
  func getEndTimeString() -> String? {
    let endDate = startTime?.addingTimeInterval((duration ?? 0) * 60)
    return endDate?.getTimeString()
  }
}
