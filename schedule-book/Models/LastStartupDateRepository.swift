//
//  LastStartupDateRepository.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/08.
//

import Foundation

class LastStartupDateRepository {
  //  MARK: - インターナル変数(Internal Properties) -

  /// シングルトン
  static let shared = LastStartupDateRepository()
  
  //  MARK: - プライベート変数(Private Properties) -

  /// UserDefaults.standard. バックアップ用キー
  private let userDefaultKey: String = "LastStartupDate"
  
  /// スケジュールデータ
  private var lastStartupDate: Date?
  
  //  MARK: -
  
  init() {
    //  最終起動日データをロード
    loadData()
    
    //  最終起動日データをセーブ
    saveData()
  }
  
  //  MARK: - インターナルメソッド(Internal Methods) -
  
  ///  最終起動日と現在が同じ日か否かを取得
  /// - Returns: true: 最終起動日と現在が同じ日 / false:最終起動日と現在が違う日
  func isSameAsPreviousDate() -> Bool {
    if let lastDate = lastStartupDate {
      let formatter = DateFormatter()
      formatter.dateStyle = .long
      formatter.timeStyle = .none
      
      if formatter.string(from: Date()) == formatter.string(from: lastDate) {
        return true
      }
    }
    return false
  }

  //  MARK: - プライベート・非公開メソッド(Private Methods) -
  
  private func loadData() {
    guard let date = UserDefaults.standard.object(forKey: userDefaultKey) as? Date
    else {
      return
    }
    
    lastStartupDate = date
  }
  
  private func saveData() {
    UserDefaults.standard.set(Date(), forKey: userDefaultKey)
  }
}
