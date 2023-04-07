//
//  CheckDate.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/04/07.
//

import Foundation

class CheckDate {
  func check1() {
    let date = Date()
    print(date) // 2023-04-06 21:07:18 +0000
  }

  func check2() {
    let df = DateFormatter()
    df.locale = Locale(identifier: "ja_JP")
    df.dateFormat = "yyyy/MM/dd" // 2023/04/07
    print(df.string(from: Date()))
    
    /// dateStyleで指定可能なパターンなので.dateStyleを使用する
  }

  func check3() {
    /// Localeで指定した地域にあわせる表現形式での日付出力
    let df = DateFormatter()
    let patternA = "ydMMM" // 2023年4月7日
    let localeCurrent = Locale.current // 2023年4月8日
    let localeJp = Locale(identifier: "ja_JP") // 2023年4月8日
    let localeUs = Locale(identifier: "en_US") // 4月 8, 2023 <- USなのに月？
    df.dateFormat = DateFormatter.dateFormat(fromTemplate: patternA, options: 0, locale: localeUs)
    print(df.string(from: Date())) // 2023年4月7日
  }

  func check4() {
    let df = DateFormatter()
    let localeCurrent = Locale.current // 金曜日
    let localeJp = Locale(identifier: "ja_JP")
    let localeUs = Locale(identifier: "en_US") // 金曜日
    df.dateFormat = DateFormatter.dateFormat(fromTemplate: "EEEE", options: 0, locale: localeJp)
    print(df.string(from: Date()))
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

  //  現在の日時に加算
  func check6() {
    var date = Date()

    let newDate = date.addingTimeInterval(10)
    print("now: \(date), addDate:\(newDate)")
    // now: 2023-04-07 20:17:38 +0000, addDate:2023-04-07 20:17:48 +0000
  }

  //  任意の日時に加算
  func check7() {
    if let date = getDate(year: 2023,month: 5,day: 1,hour: 9,minute: 0,second: 0) {
      let newDate = date.addingTimeInterval(-60)

      print("now: \(date), addDate:\(newDate)")

    }
  }
  func check8() {
    if let date = getDate(year: 2023,month: 5,day: 1,hour: 23,minute: 0,second: 0) {
      print(date) // 2023-05-10 14:00:00 +0000
    }
  }
  /// 指定日時よりDate作成
  func getDate(year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil ) -> Date? {
    var calendar = Calendar(identifier: .gregorian)
    if let date = calendar.date(from: DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)) {
      return date
    }
    return nil
  }

  // 任意のフォーマット
  func check9() {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(identifier: "Asia/Hong_Kong")
    formatter.locale = Locale(identifier: "es_PA")
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let date = Date()
    print(date)
    let strDate = formatter.string(from: date)
    print(strDate) // 2023-04-08 05:28:56
    
    // String -> Date
    if let newDate = formatter.date(from: strDate) {
      print(newDate)
    }
  }

  func check() {
    check3()
  }
  //   df.calendar = Calendar(identifier: .japanese)
}
