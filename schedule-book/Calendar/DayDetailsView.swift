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
    HStack {
      VStack {
        Text(dateData.date?.getDateAndWeek() ?? "non")
          .padding(.leading,30)
          .padding(.top)
        Spacer()
      }
      VStack {
        Button(action: {
          self.isAddSchedule.toggle()
        }) {
          if isAddSchedule {
            Image(systemName: "plus.circle").renderingMode(.original)
              .frame(width: 80,height: 80)
              .scaledToFit()
          } else {
            Image(systemName: "plus.circle").renderingMode(.original)
              .frame(width: 200)

          }
        }
        .padding(.trailing)
        Spacer()
      }
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
