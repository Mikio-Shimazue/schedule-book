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
}
