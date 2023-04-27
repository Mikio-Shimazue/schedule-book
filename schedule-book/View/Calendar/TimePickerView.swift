//
//  TimePickerView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/27.
//

import SwiftUI

struct TimePickerView: View {
  @ObservedObject var viewModel: DayDetailViewModel
  @Binding var showTimePicker: Bool
  @Binding var date: Date?
  init(showTimePicker: Binding<Bool>, date: Binding<Date?>, viewModel: ObservedObject<DayDetailViewModel>) {
    _showTimePicker = showTimePicker
    _date = date
    _viewModel = viewModel
  }

  var body: some View {
    Text(date?.getDateString() ?? "non")
      .onTapGesture {
        showTimePicker = false
        if let date = viewModel.getCurrentSchedule().startTime {
          viewModel.getCurrentSchedule().startTime = date.addingTimeInterval(60*60*3)
        }
      }
  }
}

struct TimePickerView_Previews: PreviewProvider {
  @State static var showTimePicker = false
  @State static var date: Date? = Date()
  @ObservedObject static var viewModel = DayDetailViewModel()

  static var previews: some View {
    TimePickerView(showTimePicker: $showTimePicker, date: $date,viewModel: _viewModel)
  }
}
