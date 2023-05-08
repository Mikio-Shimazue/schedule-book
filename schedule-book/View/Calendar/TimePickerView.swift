//
//  TimePickerView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/27.
//

import SwiftUI

struct TimePickerView: View {
  @Binding var showTimePicker: Bool
  @Binding var editDate: Date
  init(showTimePicker: Binding<Bool>, editDate: Binding<Date>) {
    _showTimePicker = showTimePicker
    _editDate = editDate
  }

  var body: some View {
    Text(editDate.getDateString())
      .onTapGesture {
          editDate = editDate.addingTimeInterval(60*60*3)
        showTimePicker = false
      }
  }
}

struct TimePickerView_Previews: PreviewProvider {
  @State static var showTimePicker = false
  @State static var date: Date = Date()

  static var previews: some View {
    TimePickerView(showTimePicker: $showTimePicker, editDate: $date)
  }
}
