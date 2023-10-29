//
//  DailyScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/10/28.
//

import SwiftUI

struct DailyScheduleView: View {
  @Binding var showDayDetailsView: Bool
  
  init(showDayDetailsView: Binding<Bool>) {
    _showDayDetailsView = showDayDetailsView
  }
  var body: some View {
    Text("Hello, World!\n onTap Return View")
      .multilineTextAlignment(.center)
      .onTapGesture {
        showDayDetailsView = false
      }
  }
}
/*
 #Preview {
 @State var showDayDetailsView = false
 
 DailyScheduleView(showDayDetailsView: $showDayDetailsView)
 }
 */
