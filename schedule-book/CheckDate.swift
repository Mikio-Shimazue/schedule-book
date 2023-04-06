//
//  CheckDate.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/04/07.
//

import Foundation

class CheckDate {
  func check1(){
    let date = Date()
    print(date)  // 2023-04-06 21:07:18 +0000
  }
  
  func check2() {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ja_JP")
    df.dateFormat = "yyyy/MM/dd"  // 2023/04/07
     print(df.string(from:Date()))
  }

  func check3() {
    /// 地域にあわせる形式での日付出力
    let df = DateFormatter()
    let patternA = "ydMMM" // 2023年4月7日
    let localeCurrent = Locale.current // 金曜日
    let localeJp = Locale(identifier: "ja_JP")
    let localeUs = Locale(identifier: "en_US") // 金曜日
    df.dateFormat = DateFormatter.dateFormat(fromTemplate: patternA, options: 0, locale: localeUs)
    print(df.string(from:Date())) // 2023年4月7日
  }

  func check4() {
    let df = DateFormatter()
    let localeCurrent = Locale.current // 金曜日
    let localeJp = Locale(identifier: "ja_JP")
    let localeUs = Locale(identifier: "en_US") // 金曜日
    df.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: localeJp)
    print(df.string(from:Date()))
  }

  func check5() {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .japanese)
//    dateFormatter.locale = Locale.current // 2023年4月7日 金曜日 午前6:46:05
//    dateFormatter.locale = Locale(identifier: "en_US") // Friday, April 7, 2023 at 6:44:19 AM
    dateFormatter.locale = Locale(identifier: "ja_JP")
    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .full
    let formattedDate = dateFormatter.string(from: date)
    print(formattedDate)
  }

  func check() {
    check5()
  }
  //   df.calendar = Calendar(identifier: .japanese)
}
