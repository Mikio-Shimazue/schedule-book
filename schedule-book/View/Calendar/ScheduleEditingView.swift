//
//  EditScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/24.
//

import SwiftUI

struct ScheduleEditingView: View {
  let schedule: ScheduleData
  @State var alarm = false
  
    var body: some View {
      VStack(spacing:20) {
        Text("Schedule Title").font(.title)

        HStack() {
          //  予定時刻表示部
          let startDay = schedule.startTime?.getDateString() ?? ""
          Text(startDay).font(.callout).padding(.leading)
          
          Spacer().frame(width:5)

          let startTime = schedule.startTime?.getTimeString() ?? ""
          Text(startTime)
            .font(.title)
            .padding(.leading)
            .onTapGesture {
            }
          Text("-")
            .font(.title)
            .padding(.leading)
          let endTime = schedule.getEndTimeString() ?? ""

          Text(endTime)
            .font(.title)
            .padding(.leading)
          Spacer()
        }
        Divider()
        HStack {
          Image(systemName: "alarm.waves.left.and.right")
            .resizable()
            .scaledToFit()
            .frame(height: 26,alignment: .trailing)
            .padding(.leading)
          Toggle("", isOn: $alarm)
            .padding(.trailing)
        }
        Divider()

        Spacer()  //
      }
    }
}

struct ScheduleEditingView_Previews: PreviewProvider {
    static var previews: some View {
      ScheduleEditingView(schedule: ScheduleData(startTime: Date(), duration: Double(60), information: String("予定詳細内容")))
    }
}
