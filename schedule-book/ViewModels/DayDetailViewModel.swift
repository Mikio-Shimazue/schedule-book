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
    //  該当日付のスケジュールデータを取得
    getSchedule(date: Date())
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
}
