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

struct CalendarView: View {
  let year = Calendar.current.year(for: Date()) ?? 2023
  let month = Calendar.current.month(for: Date()
  ) ?? 1
  let calendarDates = createCalendarDates(Date()
  )
  let weekdays = Calendar.current.shortWeekdaySymbols
  let columns: [GridItem] = Array(repeating: .init(.fixed(40)), count: 7)
  @State private var selectedColor = Color.gray
  @State private var backgroundColor = Color.white
  @State var counter: Int = 0
  @State private var showDayDetailsView = false
  @ObservedObject var selectDay = ViewDateData()
  @StateObject var viewModel: CalendarViewModel

  
  //  MARK: -

  init(viewModel: CalendarViewModel = CalendarViewModel()) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }

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
        
        LazyVGrid(columns: columns, spacing: 5) {
          ForEach(calendarDates) { calendarDates in
            if let date = calendarDates.date, let day = Calendar.current.day(for: date) {
              CalendarCellItem(symbol:String(day),color: selectedColor,backgroundColor: backgroundColor)
                .frame(width: 40,height: 80)
                .onTapGesture {
                  print(date)
                  selectDay.date = date
                  showDayDetailsView = true
                }
            } else {
              CalendarCellItem(color: selectedColor,backgroundColor: backgroundColor).frame(width: 40,height: 80)
            }
          }
        }
        .sheet(isPresented: $showDayDetailsView) {
          DayScheduleView(showDayDetailsView: $showDayDetailsView,dateData: _selectDay)
        }
      }
//      .frame(width: 400, height: 400, alignment: .top)
  }

  func debugPrint(day: String) {
    counter = counter + 1
    print("\(counter): \(day)")
  }
}

struct CalendarView_Previews: PreviewProvider {
  static var previews: some View {
    CalendarView()
  }
}

func createCalendarDates(_ date: Date) -> [DateInfo] {
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
