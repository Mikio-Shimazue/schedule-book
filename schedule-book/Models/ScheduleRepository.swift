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
  private var scheduleDataList: [Schedule] = []
  /// 1時間(秒)
  private let oneHour = Double(60 * 60)
  /// UserDefaults.standard. バックアップ用キー
  private let userDefaultKey: String = "Schedules"

  init(){
    loadData()
  }
  
  //  MARK: -　パブリック・公開メソッド(Public Methods) -

  /// スケジュールの登録
  /// - Parameter schedule: 登録するスケジュール
  public func setSchedule(scheduleData: Schedule) {
    scheduleDataList.append(scheduleData)
    saveData()
  }
  
  public func updateSchedule(index: Int,newScheduleData: Schedule) {
    scheduleDataList[index] = newScheduleData
    saveData()
  }
  /// スケジュールの取得
  /// - Parameter date: 取得対象の日付
  /// - Returns: dateで指定された日のスケジュール
  public func getSchedule(_ date: Date) -> [Schedule]? {
    var scheduleDatas: [Schedule] = []
    
    for schedule in scheduleDataList {
      if let startTime = schedule.startTime,
        date.isDate(date: startTime) {
          scheduleDatas.append(schedule)
      }
    }
    return scheduleDatas
  }
  
  /// スケジュール削除
  /// - Parameter id: 削除対象のスケジュールID
  public func removeSchedule(data: Schedule) {
    for schedule in scheduleDataList {
      if let date = schedule.alarm, let uuid = schedule.uuid, date == data.alarm {
        ScheduleNotification().deleteNotification(uuid, date)
      }
    }
    scheduleDataList.removeAll(where: {$0.createDate == data.createDate})
    saveData()
  }
  
  ///  スケジュールデータをUserDefaultsバックアップ
  public func saveData() {
    var scheduleListData = ScheduleListData()
    for schedule in scheduleDataList {
      scheduleListData.schedules.append(schedule.schedule)
    }
 
    updateNotification()
  
    if 0 >= scheduleListData.schedules.count ?? 0  {
      UserDefaults.standard.removeObject(forKey: userDefaultKey)
      return
    }
        
    //  JSONから変換
    let encoder = JSONEncoder()
    encoder.dateEncodingStrategy = .iso8601 // Dateフォーマット指定

    if let jsonData = try? encoder.encode(scheduleListData) {
      UserDefaults.standard.set(jsonData, forKey: userDefaultKey)
    }
  }

  //  MARK: - プライベート・非公開メソッド(Private Methods) -
  private func loadData() {
    guard let schedulesJsonData = UserDefaults.standard.object(forKey: userDefaultKey) as? Data else {
      
      //  TODO: テスト用データの読み込み処理　リリース時は消去
      makeSampleScheduleData()
      saveData()
      return
    }
        
    //  JSONから変換
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601 // Dateフォーマット指定
    guard let scheduleList: ScheduleListData = try? decoder.decode(ScheduleListData.self, from: schedulesJsonData) else {
      fatalError("Failed to decode from JSON.")
    }
    
    for schedule in scheduleList.schedules {
      var scheduleData = Schedule(uuid: schedule?.uuid)
      scheduleData.createDate = schedule?.createDate
      scheduleData.startTime = schedule?.startTime
      scheduleData.duration = schedule?.duration
      scheduleData.information = schedule?.information
      setSchedule(scheduleData: scheduleData)
    }
  }
  
  private func updateNotification() {
    for schedule in scheduleDataList {
      if let uuid = schedule.uuid, let date = schedule.alarm {
        ScheduleNotification().deleteNotification(uuid,date)
      }
    }
    for schedule in scheduleDataList {
      if let alarmDate = schedule.alarm {
        if let uuid = schedule.uuid, let date = schedule.alarm {
          ScheduleNotification().setScheduleNotification(uuid,date)
        }
      }
    }
  }
  /// テスト用スケジュールデータ登録処理
  private func makeSampleScheduleData() {
    var scheduleData = Schedule()
    
    scheduleData.startTime = Date(timeIntervalSinceNow: 1)
    scheduleData.duration = oneHour
    scheduleData.information = "エンジニア　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    setSchedule(scheduleData: scheduleData)
    
    scheduleData = Schedule()
    scheduleData.startTime = Date()
    scheduleData.duration = oneHour
    scheduleData.information = "ブログ　オンラインウェビナー【ChatGPTを使いこなせ！！】"
    scheduleData.alarm = Date()
    
    setSchedule(scheduleData: scheduleData)
  }

}
