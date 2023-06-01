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
  @State var startTime = Date()
  @State var duration = Double(0)
  @State var alarm = false
  @State var scheduleData = ScheduleData()
  @State var title  = defaultTitle
  
  private var viewModelIndex: Int = 0
  private static let defaultTitle = "タイトル"
  private static let defaultTime = "--"

  init(viewModel: ObservedObject<DayDetailViewModel>, viewModelIndex: Int
) {
    self.viewModelIndex = viewModelIndex
    _viewModel = viewModel
  }

  var body: some View {
    VStack(spacing: 20) {
      // 新規追加の場合のパディング
      if viewModelIndex == -1 {
        Spacer().frame(height:30)
      }
      HStack{
        Spacer()
        Button("✔️"){
          // 編集データを登録
          scheduleData.startTime = startTime
          scheduleData.information = title
          scheduleData.duration = duration
          viewModel.setCurrentScheduleData(scheduleData: scheduleData)
        }
        .foregroundColor(.white)
        
        Spacer().frame(width: 30)
      }
      
      
//      Text( information.get3PointLeaderString(getCount: 10) ).font(.title)

      VStack {
        TextField(ScheduleEditingView.defaultTitle, text: $title)
          .font(.title)
      }
      .contentShape( RoundedRectangle(cornerRadius: 0.0))
      .onTapGesture {
        UIApplication.shared.endEditing()
      }
      Divider()
      HStack {
        //  予定時刻表示部(日付）
        Text(startTime.getDateString() ).font(.callout).padding(.leading)

        Spacer().frame(width: 5)

        //  予定時刻表示部(開始時間）
        Text(startTime.getTimeString())
          .font(.title)
          .padding(.leading)
          .onTapGesture {}
        Text("-")
          .font(.title)
          .padding(.leading)

        //  予定時刻表示部(終了時間）
        Text(startTime.getAddingTimeString(addingTime: duration))
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
      if 0 <= viewModel.getCurrentScheduleIndex() {
        HStack {
          Spacer() //
          Button("削除"){
            viewModel.deleteCurrentScheduleData()
          }
          Spacer().frame(width: 30)
        }
      }
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
      if 0 <= viewModelIndex {
        viewModel.setCurrentScheduleIndex(index: viewModelIndex)
        //  編集用データにセット
        scheduleData =  viewModel.getCurrentSchedule()
      } else {
        viewModel.setCurrentScheduleIndex(index: -1)
      }
      if let titleText = scheduleData.information {
        title = titleText
      }
      if let time = scheduleData.startTime {
        startTime = time
      } else if let time = viewModel.day {
        startTime = time
      }
      duration = scheduleData.duration ?? 0
    }
  }
}

struct ScheduleEditingView_Previews: PreviewProvider {
  @ObservedObject static var viewModel = DayDetailViewModel()
  static var previews: some View {
    VStack{
      ScheduleEditingView(viewModel:_viewModel, viewModelIndex: 0)
    }
    .onAppear(){
      viewModel.setDay(date: Date())
    }
  }
}

extension UIApplication {
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
