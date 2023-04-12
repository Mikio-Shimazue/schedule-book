//
//  DayDetailsView.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/04/10.
//

import SwiftUI

final class ViewDateData: ObservableObject {
  @Published var date: Date? = Date()
}

struct DayDetailsView: View {
  @Binding var showDayDetailsView: Bool
  @ObservedObject var dateData: ViewDateData
  @State private var isAddSchedule = false

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        Text(dateData.date?.getDateAndWeek() ?? "non")
          .padding(.leading,30)
        Spacer()
        Button(action: {
          self.isAddSchedule.toggle()
        }) {
          if isAddSchedule {
            Image(systemName: "plus.circle")
              .resizable()
              .frame(width: 30,height: 30)
              .scaledToFit()
          } else {
            Image(systemName: "plus.circle")
              .resizable()
              .frame(width: 30,height: 30,alignment: .top)
            
          }
        }
        .padding(.trailing)
      }
      .padding(.bottom,20)
      //  予定リスト
      ScheduleListItem()

      Spacer()
    }
  }
}


struct DayDetails_Previews: PreviewProvider {
  @State private static var showDayDetailsView = false
  @ObservedObject static var dateData = ViewDateData()
  static var previews: some View {
    DayDetailsView(showDayDetailsView: $showDayDetailsView, dateData: dateData)
  }
}

extension Date {
  func getDateAndWeek() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar.current
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "M月d日(EEEE)" //  <- 多言語の場合ここを言語別テーブルへ変更
    
    let formattedDate = dateFormatter.string(from: self)
    
    return formattedDate
  }
}

func RGBColor(red: Double, green: Double, blue: Double, alpha: Double = 255) -> Color {
  print(CUnsignedChar.max)
    return Color(
      red: red / Double(CUnsignedChar.max),
      green: green / Double(CUnsignedChar.max),
      blue: blue / Double(CUnsignedChar.max),
      opacity: alpha / Double(CUnsignedChar.max))
}
