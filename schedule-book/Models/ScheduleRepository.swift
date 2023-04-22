//
//  ScheduleRepository.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/21.
//

import Foundation

//  スケジュールデータ管理クラス
class ScheduleRepository  {
  static let shared = ScheduleRepository()
  private var scheduleDataList: [ScheduleData?] = []
  
  /// スケジュールの登録
  /// - Parameter schedule: 登録するスケジュール
  public func setSchedule(scheduleData: ScheduleData) {
    scheduleDataList.append(scheduleData)
  }
  
  /// スケジュールの取得
  /// - Parameter date: 取得対象の日付
  /// - Returns: dateで指定された日のスケジュール
  public func getSchedule(_ date: Date) -> [ScheduleData]? {
    var scheduleDatas: [ScheduleData]? = []
    var scheduleData = ScheduleData()
    
    scheduleData.startTime = date
    scheduleData.duration = 60
    scheduleData.information = "エンジニア　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    
    scheduleDatas?.append(scheduleData)
    
    scheduleData = ScheduleData()
    scheduleData.startTime = date
    scheduleData.duration = 60
    scheduleData.information = "ブログ　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    
    scheduleDatas?.append(scheduleData)
    
    return scheduleDatas
  }
}
