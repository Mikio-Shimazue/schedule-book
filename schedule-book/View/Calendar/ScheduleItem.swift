//
//  ScheduleItem.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/12.
//

import SwiftUI

struct ScheduleItem: View {
  let schedule: ScheduleData
  /// 時刻部背景色
  let timeColor: Color = Color.rgb(red: 251,green: 238,blue: 223)
  /// 予定内容ぶ背景色
  let infoColor: Color = Color.rgb(red: 202,green: 255,blue: 246)

  var body: some View {
    //  予定表示
    HStack() {
      Spacer().frame(width:5)
      //  予定時刻表示部
      VStack(){
        if let startTime = schedule.getStartTimeString() {
          Text(startTime)
        } else {
          Text("--:--")
        }
        Text("|")
        if let endTime = schedule.getEndTimeString() {
          Text(endTime)
        } else {
          Text("--:--")
        }
      }
//      .frame(width: 60, height: 60, alignment: .center)
      .background(timeColor)
//      .padding(.leading,3)
      
      Divider()
    
      HStack() {
        Text(schedule.information ?? "")
//          .frame(width:250, height:20,alignment: .leading)
          .padding(.leading,10)
        
        Image(systemName: "alarm.waves.left.and.right")
          .frame(height: 10,alignment: .trailing)
          .padding(.trailing,10)
      }
      .frame(height: 60,alignment: .center)
      .background(infoColor)
      
      Spacer()  //  右側にスペーサー入れると左寄せになる
    }
    .frame(height: 60,alignment: .leading)
  }
}

struct ScheduleItem_Previews: PreviewProvider {
    static var previews: some View {
      ScheduleItem(schedule: ScheduleData(startTime: Date(), duration: Double(60), information: String("予定詳細内容")))
    }
}
