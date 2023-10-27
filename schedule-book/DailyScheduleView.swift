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
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}
/*
 #Preview {
 @State var showDayDetailsView = false
 
 DailyScheduleView(showDayDetailsView: $showDayDetailsView)
 }
 */
