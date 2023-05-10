//
//  ScheduleRepository.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/21.
//

import Foundation

//  スケジュールデータ管理クラス
class ScheduleRepository  {
  
  //  MARK: - インターナル変数(Internal Properties) -
  /// シングルトン
  static let shared = ScheduleRepository()
  
  //  MARK: - プライベート変数(Private Properties) -

  /// スケジュールデータ
  private var scheduleDataList: [ScheduleData] = []
  
  init(){
    loadData()
  }
  
  //  MARK: -　パブリック・公開メソッド(Public Methods) -

  /// スケジュールの登録
  /// - Parameter schedule: 登録するスケジュール
  public func setSchedule(scheduleData: ScheduleData) {
    scheduleDataList.append(scheduleData)
  }
  
  /// スケジュールの取得
  /// - Parameter date: 取得対象の日付
  /// - Returns: dateで指定された日のスケジュール
  public func getSchedule(_ date: Date) -> [ScheduleData]? {
    var scheduleDatas: [ScheduleData] = []
    
    for schedule in scheduleDataList {
      if let startTime = schedule.startTime,
        date.isDate(date: startTime) {
          scheduleDatas.append(schedule)
      }
    }
    return scheduleDatas
  }
  
  //  MARK: - プライベート・非公開メソッド(Private Methods) -
  private func loadData() {

    var scheduleData = ScheduleData()
    
    scheduleData.startTime = Date()
    scheduleData.duration = 60
    scheduleData.information = "エンジニア　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    
    scheduleDataList.append(scheduleData)
    
    scheduleData = ScheduleData()
    scheduleData.startTime = Date()
    scheduleData.duration = 60
    scheduleData.information = "ブログ　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    
    scheduleDataList.append(scheduleData)
  }

}
