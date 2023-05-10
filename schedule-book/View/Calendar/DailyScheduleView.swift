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
  @ObservedObject var viewModel: DayDetailViewModel

  //  MARK: -

  init(showDayDetailsView: Binding<Bool>,
       dateData: ObservedObject<ViewDateData>,viewModel: ObservedObject<DayDetailViewModel>
) {
    _showDayDetailsView = showDayDetailsView
    _dateData = dateData
    _viewModel = viewModel
  }

  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        HStack(alignment: .top) {
          Text(dateData.date?.getDateAndWeek() ?? "non")
            .padding(.leading,30)
          Spacer()
          Button(action: {
            self.isAddSchedule.toggle()
          }) {
            if isAddSchedule {
              Image(systemName: "plus")
                .resizable()
                .frame(width: 24,height: 24)
                .scaledToFit()
            } else {
              Image(systemName: "plus")
                .resizable()
                .frame(width: 24,height: 24,alignment: .top)
              
            }
          }
          .padding(.trailing,30)
        }
        .padding(.bottom,20)
        //  予定リスト
        List(viewModel.schedules.indices, id: \.self) { index in
          NavigationLink(destination: ScheduleEditingView(viewModel: _viewModel,viewModelIndex: index).onDisappear(){

          }
          ) {
            ScheduleView(scheduleData: viewModel.schedules[index])
          }
        }
        Spacer()
      }
    }
    .sheet(isPresented: $isAddSchedule,
           onDismiss: {
      // sheetで表示したViewを閉時時の処理が必要な場合はここに記述
    }) {
      ScheduleEditingView(viewModel: _viewModel,viewModelIndex: -1)
    }

  }
}


struct DailyScheduleView_Previews: PreviewProvider {
  @State private static var showDayDetailsView = false
  @ObservedObject static var dateData = ViewDateData()
  @ObservedObject static var viewModel = DayDetailViewModel()
  static var previews: some View {
    DailyScheduleView(showDayDetailsView: $showDayDetailsView, dateData: _dateData,viewModel: _viewModel)
      .onAppear(){
        viewModel.setDay(date: Date())
      }
  }
}
