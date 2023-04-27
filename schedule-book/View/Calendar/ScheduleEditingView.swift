//
//  EditScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/24.
//

import SwiftUI

struct ScheduleEditingView: View {
  @ObservedObject var viewModel: DayDetailViewModel
  @State var alarm = false
  @State var showTimePicker = false
  @State var selectedDate: Date?
  @ObservedObject var viewDay = ViewDateData()

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
        Text(startTime)
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
          if let date = viewModel.getCurrentSchedule().startTime {
            selectedDate = date
            showTimePicker = true
          }
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
    .sheet(isPresented: $showTimePicker) {
      TimePickerView(showTimePicker: $showTimePicker, date: $selectedDate,viewModel: _viewModel)
    }
  }
}

struct ScheduleEditingView_Previews: PreviewProvider {
  @ObservedObject static var viewModel = DayDetailViewModel()
  static var previews: some View {
    ScheduleEditingView(viewModel:viewModel)
  }
}
