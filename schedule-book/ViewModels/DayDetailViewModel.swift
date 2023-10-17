//
//  DayDetailViewModel.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/22.
//

import Combine
import Foundation

/// 日付詳細ViewModel
class DayDetailViewModel: ObservableObject {
  @Published var schedules:[ScheduleData]

  var day: Date?
  /// objectWillChange.sendすることでデータの更新を通知できる
  private(set) var objectWillChange = ObservableObjectPublisher()
  private var currentIndex: Int = -1
  
  init(schedules: [ScheduleData] = [ScheduleData]()) {
    self.schedules = schedules
  }
  
  /// 指定日の予定データを抽出
  /// - Parameter date: 指定日
  func setDay(date: Date) {
    day = date
    schedules.removeAll()
    //  該当日付のスケジュールデータを取得
    getSchedule(date: date)
  }

  func setCurrentScheduleIndex(index: Int) {
    currentIndex = index
  }
  
  func getCurrentScheduleIndex() -> Int {
    return currentIndex
  }

  /// カレントスケジュールを取得
  /// - Returns: カレントスケジュール
  func getCurrentSchedule() -> ScheduleData {
    return self.schedules[currentIndex]
  }
  
  
  /// カレントスケジュールを書き替える
  /// カレント未指定の場合は新規登録
  /// - Parameter scheduleData: 新しいスケシュールデータ
  func setCurrentScheduleData(scheduleData: ScheduleData) {
    let newScheduleData = ScheduleData(
      startTime: scheduleData.startTime,
      duration: scheduleData.duration,
      information: scheduleData.information,
      alarm: scheduleData.alarm)
    
    if 0 <= currentIndex {
      self.schedules[currentIndex] = newScheduleData
    } else {
      ScheduleRepository.shared.setSchedule(scheduleData: newScheduleData)
      setDay(date:newScheduleData.startTime!)
    }
    objectWillChange.send()
  }
  
  /// カレントスケジュールを新しい開始時刻に書き替える
  /// - Parameter startTime: 新しい開始時刻
  func setCurrentScheduleStartDate(startTime: Date) {
    let newScheduleData = ScheduleData(
      startTime: startTime,
      duration: getCurrentSchedule().duration,
      information: getCurrentSchedule().information)
      
    self.schedules[currentIndex] = newScheduleData
    objectWillChange.send()
  }
  
  /// カレントインデックスデータを削除
  func deleteCurrentScheduleData() {
    ScheduleRepository.shared.removeSchedule(data: self.schedules[currentIndex])

    self.schedules.remove(at: currentIndex)
    objectWillChange.send()
  }
  //  MARK: - プライベート・非公開メソッド(Private Methods) -
  
  //  該当日付のスケジュールデータを取得
  /// - Parameter date: スケジュールを取得する日付
  private func getSchedule(date: Date) {
    //  該当日付のスケジュールデータを取得
    if let schedules = ScheduleRepository.shared.getSchedule(date) {
      for schedule in schedules {
        self.schedules.append(schedule)
      }
      objectWillChange.send()
    }
  }
}
