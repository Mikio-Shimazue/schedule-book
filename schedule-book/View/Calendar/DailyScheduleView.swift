//
//  DayScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/10.
//

import SwiftUI

final class ViewDateData: ObservableObject {
  @Published var date: Date? = Date()
}

struct DailyScheduleView: View {
  @Binding var showDayDetailsView: Bool
  @ObservedObject var dateData: ViewDateData
  @State private var isAddSchedule = false
  @StateObject var viewModel: DayDetailViewModel

  //  MARK: -

  init(showDayDetailsView: Binding<Bool>,
       dateData: ObservedObject<ViewDateData>) {
    _viewModel = StateObject(wrappedValue: DayDetailViewModel())
    _showDayDetailsView = showDayDetailsView
    _dateData = dateData
    
  }

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
      List(viewModel.schedules) { schedule in
        NavigationLink(destination: ScheduleEditingView()) {
          ScheduleView(schedule: schedule)
        }
      }
      Spacer()
    }
  }
}


struct DailyScheduleView_Previews: PreviewProvider {
  @State private static var showDayDetailsView = false
  @ObservedObject static var dateData = ViewDateData()
  static var previews: some View {
    DailyScheduleView(showDayDetailsView: $showDayDetailsView, dateData: _dateData)
  }
}
