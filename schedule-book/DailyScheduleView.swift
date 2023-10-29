//
//  DailyScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/10/28.
//

import SwiftUI

struct DailyScheduleView: View {
  @ObservedObject var sharedData: SharedDataDailyScheduleView

  var body: some View {
    Text("Hello, World Day:\(sharedData.textDay) !\n onTap Return View")
      .multilineTextAlignment(.center)
      .onTapGesture {
        sharedData.showDayDetailsView = false
      }
  }
}
/*
 #Preview {
 @State var showDayDetailsView = false
 
 DailyScheduleView(showDayDetailsView: $showDayDetailsView)
 }
 */
