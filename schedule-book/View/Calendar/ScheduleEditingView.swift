//
//  EditScheduleView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/24.
//

import SwiftUI

struct ScheduleEditingView: View {
  @ObservedObject var viewModel: DayDetailViewModel
  @State var showTimePicker = false
  @State var title = defaultTitle
  @State var startTime = Date()
  @State var endTimeString = "00"
  @State var alarm = false
  @State var scheduleData = ScheduleData()
  private static let defaultTitle = "non"
  private static let defaultTime = "--"

  init(viewModel: ObservedObject<DayDetailViewModel>
) {
    _viewModel = viewModel
  }

  var body: some View {
    VStack(spacing: 20) {
      HStack{
        Spacer()
        Button("✔️"){
          
        }
        .foregroundColor(.white)
        
        Spacer().frame(width: 30)
      }
      
      Text(title ).font(.title)

      HStack {
        //  予定時刻表示部(日付）
        Text(startTime.getDateString() ).font(.callout).padding(.leading)

        Spacer().frame(width: 5)

        //  予定時刻表示部(開始時間）
        Text(startTime.getTimeString() ?? ScheduleEditingView.defaultTime )
          .font(.title)
          .padding(.leading)
          .onTapGesture {}
        Text("-")
          .font(.title)
          .padding(.leading)

        //  予定時刻表示部(終了時間）
        Text(endTimeString )
          .font(.title)
          .padding(.leading)
        Spacer()
      }
      .onTapGesture {
        withAnimation {
          showTimePicker = true
        }
      }
      Divider()
      HStack {
        Image(systemName: "alarm.waves.left.and.right")
          .resizable()
          .scaledToFit()
          .frame(height: 26, alignment: .trailing)
          .padding(.leading)
        Toggle("", isOn: $alarm)
          .padding(.trailing)
      }
      Divider()

      Spacer() //
    }
    .sheet(isPresented: $showTimePicker,
           onDismiss: {
      // sheetで表示したViewを閉時時の処理が必要な場合はここに記述
    }) {
      TimePickerView(showTimePicker: $showTimePicker,editDate: $startTime)
    }
    .onAppear(){
      //  画面表示前処理
      
      scheduleData =  viewModel.getCurrentSchedule()
      
      title = scheduleData.getTitleString() ?? ScheduleEditingView.defaultTitle
      if let time = scheduleData.startTime {
        startTime = time
      }
      if let endTime = scheduleData.getEndTimeString() {
        endTimeString = endTime
      }
    }
  }
}

struct ScheduleEditingView_Previews: PreviewProvider {
  @ObservedObject static var viewModel = DayDetailViewModel()
  static var previews: some View {
    VStack{
      ScheduleEditingView(viewModel:_viewModel)
    }
    .onAppear(){
      viewModel.setDay(date: Date())
    }

  }
}
