//
//  CalendarView.swift
//  schedule-book
//
//  Created by 島Work on 2023/02/14.
//

import SwiftUI

struct DateInfo: Identifiable {
  var id = UUID()
  var date: Date?
}

class SharedDataDailyScheduleView: ObservableObject {
  @Published var showDayDetailsView = false
  @Published var textDay = ""
}

struct CalendarView: View {
  let year = Calendar.current.year(for: Date()) ?? 2023
  let month = Calendar.current.month(for: Date()
  ) ?? 1
  let calendarDates = createCalendarDates(Date()
  )
  let weekdays = Calendar.current.shortWeekdaySymbols
  let columns: [GridItem] = Array(repeating: .init(.fixed(40)), count: 7)

  @ObservedObject var sharedData: SharedDataDailyScheduleView = SharedDataDailyScheduleView()
  
  var body: some View {
    VStack {
      //  yyyy/MM
      Text(String(format: "%4d年%2d月", year, month))
        .font(.system(size: 20))
        
      //  曜日
      HStack {
        ForEach(weekdays, id: \.self) { weekday in
          Text(weekday).frame(width: 40, height: 40, alignment: .center)
        }
      }
        
      LazyVGrid(columns: columns, spacing: 20) {
        ForEach(calendarDates) { calendarDates in
          if let date = calendarDates.date, let day = Calendar.current.day(for: date) {
            Text("\(day)")
              .frame(width: 40, height: 100, alignment: .top)
              .onTapGesture {
                self.sharedData.textDay = String(day)
                self.sharedData.showDayDetailsView = true
              }
          }
          else {
            Text("")
          }
        }
      }
      .sheet(isPresented: $sharedData.showDayDetailsView) {
        DailyScheduleView(sharedData: sharedData)
      }
    }
//      .frame(width: 400, height: 400, alignment: .top)
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarView()
  }
}


func createCalendarDates(_ date: Date) -> [DateInfo] {

  let codeCheck = CodeCheck()
  codeCheck.check()
  
  var days = [DateInfo]()
  
  let startOfMonth = Calendar.current.startDayOfMonth(for: date)
  let daysInMonth = Calendar.current.daysInMonth(for: date)
  
  guard let daysInMonth = daysInMonth, let startOfMonth = startOfMonth else {
    return days
  }
  
  for day in 0..<daysInMonth {
    days.append(DateInfo(date: Calendar.current.date(byAdding: .day, value: day, to: startOfMonth)))
  }
  
  guard
    let firstDay = days.first,
    let lastDay = days.last,
    let firstDate = firstDay.date,
    let lastDate = lastDay.date,
    let firstDateWeekday = Calendar.current.weekday(for: firstDate),
    let lastDateWeekday = Calendar.current.weekday(for: lastDate)
  else {
    return days
  }
  
  let firstWeekEmptyDays = firstDateWeekday - 1
  let lastWeekEmptyDays = 7 - lastDateWeekday
  
  for _ in 0..<firstWeekEmptyDays {
    days.insert(DateInfo(date: nil), at: 0)
  }
  
  for _ in 0..<lastWeekEmptyDays {
    days.append(DateInfo(date: nil))
  }
  
  return days
}

