//
//  EditScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/24.
//

import SwiftUI

struct ScheduleEditingView: View {
  @ObservedObject var viewModel: DayDetailViewModel
  @State var showTimePicker = false
  @State var startTimeText = ""
  @State var alarm = false

  var body: some View {
    VStack(spacing: 20) {
      let title = viewModel.getCurrentSchedule().information
      Text(title ?? "non").font(.title)

      HStack {
        //  予定時刻表示部
        let startDay = viewModel.getCurrentSchedule().startTime?.getDateString() ?? ""
        Text(startDay).font(.callout).padding(.leading)

        Spacer().frame(width: 5)

        let startTime = viewModel.getCurrentSchedule().startTime?.getTimeString() ?? ""
        Text(startTimeText.isEmpty ? viewModel.getCurrentSchedule().startTime?.getTimeString() ?? "" : startTimeText)
          .font(.title)
          .padding(.leading)
          .onTapGesture {}
        Text("-")
          .font(.title)
          .padding(.leading)
        let endTime = viewModel.getCurrentSchedule().getEndTimeString() ?? ""

        Text(endTime)
          .font(.title)
          .padding(.leading)
        Spacer()
      }
      .onTapGesture {
        withAnimation {
          showTimePicker = true
        }
      }
      Divider()
      HStack {
        Image(systemName: "alarm.waves.left.and.right")
          .resizable()
          .scaledToFit()
          .frame(height: 26, alignment: .trailing)
          .padding(.leading)
        Toggle("", isOn: $alarm)
          .padding(.trailing)
      }
      Divider()

      Spacer() //
    }
    .sheet(isPresented: $showTimePicker,
           onDismiss: {
      // sheetで表示したViewを閉時時の処理
      //  表示時刻のTimePickerで編集後の時刻に更新
      startTimeText = viewModel.getCurrentSchedule().startTime?.getTimeString() ?? ""
      print("")
    }) {
      TimePickerView(showTimePicker: $showTimePicker,viewModel: _viewModel)
    }
  }
}

struct ScheduleEditingView_Previews: PreviewProvider {
  @ObservedObject static var viewModel = DayDetailViewModel()
  static var previews: some View {
    ScheduleEditingView(viewModel:viewModel)
  }
}
