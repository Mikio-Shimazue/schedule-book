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
  init(showTimePicker: Binding<Bool>, viewModel: ObservedObject<DayDetailViewModel>) {
    _showTimePicker = showTimePicker
    _viewModel = viewModel
  }

  var body: some View {
    Text(viewModel.getCurrentSchedule().startTime?.getDateString() ?? "non")
      .onTapGesture {
        if let date = viewModel.getCurrentSchedule().startTime {
          self.viewModel.getCurrentSchedule().startTime = date.addingTimeInterval(60*60*3)
        }
        showTimePicker = false
      }
  }
}

struct TimePickerView_Previews: PreviewProvider {
  @State static var showTimePicker = false
  @State static var date: Date? = Date()
  @ObservedObject static var viewModel = DayDetailViewModel()

  static var previews: some View {
    TimePickerView(showTimePicker: $showTimePicker, viewModel: _viewModel)
  }
}
