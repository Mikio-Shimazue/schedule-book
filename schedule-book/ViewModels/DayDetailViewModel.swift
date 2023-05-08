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
  
  init(schedules: [ScheduleData] = [ScheduleData]()) {
    self.schedules = schedules
  }

  func setDay(date: Date) {
    schedules.removeAll()
    //  該当日付のスケジュールデータを取得
    getSchedule(date: date)
  }

  //  該当日付のスケジュールデータを取得
  /// - Parameter date: スケジュールを取得する日付
  func getSchedule(date: Date) {
    //  該当日付のスケジュールデータを取得
    if let schedules = ScheduleRepository.shared.getSchedule(date) {
      for schedule in schedules {
        self.schedules.append(schedule)
      }
      objectWillChange.send()
    }
  }
  
  func getCurrentSchedule() -> ScheduleData {
    return self.schedules[0]
  }
  
  func setCurrentScheduleStartDate(startTime: Date) {
    let newScheduleData = ScheduleData(
      startTime: startTime,
      duration: getCurrentSchedule().duration,
      information: getCurrentSchedule().information)
      
    self.schedules[0] = newScheduleData
    objectWillChange.send()
  }
}
