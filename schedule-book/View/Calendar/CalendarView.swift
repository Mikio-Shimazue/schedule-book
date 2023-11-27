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
  @State var year = Calendar.current.year(for: Date()) ?? 2023
  @State var month = Calendar.current.month(for: Date()
  ) ?? 1
  @State var calendarDates = createCalendarDates(Date())
  let weekdays = Calendar.current.shortWeekdaySymbols
  let columns: [GridItem] = Array(repeating: .init(.fixed(42)), count: 7)
  private let selectedColor = [Color.red, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.blue]
  private let backgroundColor = Color.white
  private let backgroundColorEmpty = Color.rgb(red: 235, green: 235, blue: 235)
  @State var counter: Int = 0
  @State private var showDayDetailsView = false
  @ObservedObject var selectDay = ViewDateData()
  @StateObject var viewModel: CalendarViewModel
  @ObservedObject var dayViewModel = DayDetailViewModel()
  
  //  MARK: -

  init(viewModel: CalendarViewModel = CalendarViewModel()) {
    _viewModel = StateObject(wrappedValue: viewModel)
  }

  var body: some View {
    VStack {
      HStack {
        Button(action: {
          month = month - 1
          if 1 > month {
            year = year - 1
            month = 12
          }
          let calendar = Calendar(identifier: .gregorian)
          if let date = calendar.date(from: DateComponents(year: year, month: month, day: 1)) {
            // 前月に切替
            calendarDates = createCalendarDates(date)
          }
        }) {
          Image(systemName: "arrow.backward.circle")
        }
        .padding(.leading)
        Spacer()
        //  yyyy/MM
        Text(String(format: "%4d年%2d月", year, month))
          .font(.system(size: 20))
        Spacer()
        Button(action: {
          // 次月に切替
          month = month + 1
          if 12 < month {
            year = year + 1
            month = 1
          }
          let calendar = Calendar(identifier: .gregorian)
          if let date = calendar.date(from: DateComponents(year: year, month: month, day: 1)) {
            // 前月に切替
            calendarDates = createCalendarDates(date)
          }
        }) {
          Image(systemName: "arrow.right.circle")
        }
        .padding(.trailing)
      }
      //  曜日
      HStack {
        ForEach(weekdays, id: \.self) { weekday in
          Text(weekday).frame(width: 40, height: 40, alignment: .center)
        }
      }
        
      LazyVGrid(columns: columns, spacing: 5) {
        ForEach(calendarDates) { calendarDates in
          if let date = calendarDates.date, let day = Calendar.current.day(for: date) {
            let week = Calendar.current.component(.weekday, from: date)
            CalendarCellItem(day: date, symbol: String(day), color: selectedColor[week - 1], backgroundColor: backgroundColor)
              .frame(width: 40, height: 80)
              .onTapGesture {
                print(date)
                selectDay.date = date
                showDayDetailsView = true
                dayViewModel.setDay(date: date)
              }
          } else {
            CalendarCellItem(color: selectedColor[0], backgroundColor: backgroundColorEmpty).frame(width: 40, height: 80)
          }
        }
      }
      .sheet(isPresented: $showDayDetailsView) {
        DailyScheduleView(showDayDetailsView: $showDayDetailsView, dateData: _selectDay, viewModel: _dayViewModel)
      }
    }
//      .padding()  //  縦横均一
//      .padding(.bottom, 100)  //  下だけ
    .padding(EdgeInsets(top: 10, leading: 0, bottom: 30, trailing: 0))
    .background(Color.rgb(red: 220, green: 230, blue: 255, alpha: 255))
//      .background(Color.blue)
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
  var lastWeekEmptyDays = 7 - lastDateWeekday

  let calendar = Calendar(identifier: .gregorian)
  let dayCount = calendar.component(.day, from: lastDate)
  if 42 > (firstWeekEmptyDays + dayCount + lastWeekEmptyDays) {
    lastWeekEmptyDays = 42 - (firstWeekEmptyDays + dayCount)
  }


  for _ in 0..<firstWeekEmptyDays {
    days.insert(DateInfo(date: nil), at: 0)
  }
  
  for _ in 0..<lastWeekEmptyDays {
    days.append(DateInfo(date: nil))
  }
  
  return days
}
