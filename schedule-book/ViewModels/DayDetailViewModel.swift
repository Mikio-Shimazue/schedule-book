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
  /// objectWillChange.sendすることでデータの更新を通知できる
  private(set) var objectWillChange = ObservableObjectPublisher()
  @Published var schedules:[ScheduleData]
  private var currentIndex: Int = -1
  
  init(schedules: [ScheduleData] = [ScheduleData]()) {
    self.schedules = schedules
  }
  
  /// 指定日の予定データを抽出
  /// - Parameter date: 指定日
  func setDay(date: Date) {
    schedules.removeAll()
    //  該当日付のスケジュールデータを取得
    getSchedule(date: date)
  }

  func setCurrentScheduleIndex(index: Int) {
    currentIndex = index
  }
  /// カレントスケジュールを取得
  /// - Returns: カレントスケジュール
  func getCurrentSchedule() -> ScheduleData {
    return self.schedules[currentIndex]
  }
  
  
  /// カレントスケジュールを新しいスケジュールに書き替える
  /// - Parameter scheduleData: 新しいスケシュールデータ
  func setCurrentScheduleData(scheduleData: ScheduleData) {
    let newScheduleData = ScheduleData(
      startTime: scheduleData.startTime,
      duration: scheduleData.duration,
      information: scheduleData.information)
    
    self.schedules[currentIndex] = newScheduleData
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
