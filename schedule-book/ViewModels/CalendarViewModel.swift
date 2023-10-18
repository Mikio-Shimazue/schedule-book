//
//  CalendarViewModel.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/21.
//

import Combine
import Foundation

/// スケジュールViewModel
class CalendarViewModel: ObservableObject {
  /// objectWillChange.sendすることでデータの更新を通知できる
  private(set) var objectWillChange = ObservableObjectPublisher()
  @Published var schedules:[Schedule]
  
  init(schedules: [Schedule] = [Schedule]()) {
    self.schedules = schedules
    getSchedule(date: Date())
  }
  
  func getSchedule(date: Date) {
    if let schedules = ScheduleRepository.shared.getSchedule(date) {
      for schedule in schedules {
        self.schedules.append(schedule)
      }
      objectWillChange.send()
    }
  }
}
