//
//  ScheduleListItem.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/04/12.
//

import SwiftUI

struct ScheduleListItem: View {
  let startTime: String = "10:20"
  let endTime: String = "11:30"
  let messageText: String = "Appointment details"
  let isAlarm: Bool = true
  /// 時刻部背景色
  let timeColor: Color = RGBColor(red: 251,green: 238,blue: 223)
  /// 予定内容ぶ背景色
  let infoColor: Color = RGBColor(red: 202,green: 255,blue: 246)
  
  var body: some View {
    //  予定表示
    HStack() {
      Spacer().frame(width:5)
      //  予定時刻表示部
      VStack(){
        Text(startTime)
        Text("|")
        Text(endTime)
      }
      .frame(width: 80, height: 60, alignment: .center)
      .background(timeColor)
//      .padding(.leading,3)
      
      Divider()
    
      HStack() {
        Text(messageText)
          .frame(width:230, height:20,alignment: .leading)
          .padding(.leading,5)
        
        Image(systemName: "alarm.waves.left.and.right")
          .frame(height: 10,alignment: .trailing)
      }
      .frame(height: 60,alignment: .center)
      .background(infoColor)
      
      Spacer()  //  右側にスペーサー入れると左寄せになる
    }
    .frame(height: 60,alignment: .leading)
  }
}

struct ScheduleListItem_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListItem()
    }
}
