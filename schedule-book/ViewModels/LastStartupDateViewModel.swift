//
//  LastStartupDateViewModel.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/08.
//

import Combine
import Foundation

// スケジュールViewModel
class LastStartupDateViewModel: ObservableObject {
  /// objectWillChange.sendすることでデータの更新を通知できる
  private(set) var objectWillChange = ObservableObjectPublisher()
  @Published var isSameAsPreviousDate: Bool = false
  
  init() {
    readSameAsPreviousDate()
  }
  //  今回起動が最終起動日と同じか否かを読込み
  private func readSameAsPreviousDate() {
    isSameAsPreviousDate = LastStartupDateRepository.shared.isSameAsPreviousDate()
 }
}
