//
//  Schedule.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/19.
//

import Foundation
import SwiftUI

class Schedule: Identifiable {

  var schedule: ScheduleData = ScheduleData()

  public var createDate: Date? {
    set(value){
      schedule.startTime = value
    }
    get {
      return schedule.createDate
    }
  }
  /// 開始日時
  public var startTime: Date? {
    set(value){
      schedule.startTime = value
    }
    get {
      return schedule.startTime
    }
  }
  /// 予定時間（分)
  public var duration: Double? {
    set(value){
      schedule.duration = value
    }
    get {
      return schedule.duration
    }
  }
  /// 予定情報
  public var information: String? {
    set(value){
      schedule.information = value
    }
    get {
      return schedule.information
    }
  }
  /// 通知時刻
  public var alarm: Date? {
    set(value){
      schedule.alarm = value
    }
    get {
      return schedule.alarm
    }
  }
  /*
  /// 文字色（デフォルト：黒）
  var color: Color {
    set(value){
      schedule.color = value
    }
    get {
      return schedule.color
    }
  }
  */
  init(startTime: Date? = nil, duration: Double? = nil, information: String? = nil, alarm: Date? = nil) {
    createDate = Date()
    self.startTime = startTime
    self.duration = duration
    self.information = information
    self.alarm = alarm
  }
  

  /// 開始時刻（String）取得
  /// - Returns: 開始時刻(HH:mm)取得
  func getStartTimeString() -> String? {
    return schedule.startTime?.getTimeString()
  }
  
  func getEndTimeString() -> String? {
    if let duration = schedule.duration {
      return schedule.startTime?.getAddingTimeString(addingTime: duration)
    }
    return nil
  }

  func getAlarmTime() -> Date? {
    return schedule.alarm
  }
}
