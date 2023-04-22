//
//  DayDetailsView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/10.
//

import SwiftUI

final class ViewDateData: ObservableObject {
  @Published var date: Date? = Date()
}

struct DayDetailsView: View {
  @Binding var showDayDetailsView: Bool
  @ObservedObject var dateData: ViewDateData
  @State private var isAddSchedule = false
  @StateObject var viewModel: CalendarViewModel

  //  MARK: -

  init(viewModel: CalendarViewModel = CalendarViewModel(),showDayDetailsView: Binding<Bool>,
       dateData: ObservedObject<ViewDateData>) {
    _viewModel = StateObject(wrappedValue: viewModel)
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
      List(viewModel.schedules) { date in
        NavigationLink(destination: RepositoryView()) {
          ScheduleListItem()
        }
      }
      //  予定リスト
//      ScheduleListItem()

      Spacer()
    }
  }
}


struct DayDetails_Previews: PreviewProvider {
  @State private static var showDayDetailsView = false
  @ObservedObject static var dateData = ViewDateData()
  static var previews: some View {
    DayDetailsView(showDayDetailsView: $showDayDetailsView, dateData: _dateData)
  }
}
