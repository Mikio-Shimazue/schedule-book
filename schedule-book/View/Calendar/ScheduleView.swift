//
//  ScheduleItem.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/12.
//

import SwiftUI

struct ScheduleView: View {
  var scheduleData: ScheduleData

  /// 時刻部背景色
  let timeColor: Color = Color.rgb(red: 251, green: 238, blue: 223)
  /// 予定内容背景色
  let infoColor: Color = Color.rgb(red: 202, green: 255, blue: 246)

  var body: some View {
    //  予定表示
    HStack {
      Spacer().frame(width: 5)
      //  予定時刻表示部
      VStack {
        Text(scheduleData.startTime?.getTimeString() ?? "" )

        Text("|")
        if let endTime = scheduleData.getEndTimeString() {
          Text(endTime)
        } else {
          Text("--:--")
        }
      }
//      .frame(width: 60, height: 60, alignment: .center)
      .background(timeColor)
//      .padding(.leading,3)

      Divider()

      HStack {
        Text(scheduleData.information ?? "")
//          .frame(width:250, height:20,alignment: .leading)
          .padding(.leading, 10)

        Image(systemName: "alarm.waves.left.and.right")
          .frame(height: 10, alignment: .trailing)
          .padding(.trailing, 10)
      }
      .frame(height: 60, alignment: .center)
      .background(infoColor)

      Spacer() //  右側にスペーサー入れると左寄せになる
    }
    .frame(height: 60, alignment: .leading)
  }
}

struct ScheduleView_Previews: PreviewProvider {
  static var scheduleData =  ScheduleData(startTime:Date(),information: "SwiftUI マスターしよう")

  static var previews: some View {
    ScheduleView(scheduleData: scheduleData)
  }
}
