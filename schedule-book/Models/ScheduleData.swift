//
//  ScheduleData.swift
//  schedule-book
//
//  Created by Mikizin on 2023/10/18.
//

import Foundation

struct ScheduleListData: Codable {
  var schedules: [ScheduleData?] = []
}

struct ScheduleData: Codable {
  var createDate: Date?
  /// 開始日時
  var startTime: Date?
  /// 予定時間（分)
  var duration: Double?
  /// 予定情報
  var information: String?
  /// 通知時刻
  var alarm: Date?
  /// 文字色（デフォルト：黒）
//  var color: Color

  enum CodingKeys: String,CodingKey {
    case createDate
    case startTime
    case duration
    case information
    case alarm
//    case color
  }
}
