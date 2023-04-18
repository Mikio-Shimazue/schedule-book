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
    let localeCha = Locale(identifier: "zh") // 4月 8, 2023 <- USなのに月？
    let localeKo = Locale(identifier: "ko") // 4月 8, 2023 <- USなのに月？
  df.dateFormat = DateFormatter.dateFormat(fromTemplate: patternA, options: 0, locale: localeKo)
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
  
  
  func check5_1() {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.locale = Locale(identifier: "ja_JP")
//    dateFormatter.locale = Locale.current シュミレーターの場合NG
    dateFormatter.dateStyle = .full
    dateFormatter.timeStyle = .full
    let formattedDate = dateFormatter.string(from: date)

    print(formattedDate) // 2023年4月15日 土曜日 9時01分25秒 日本標準時
  }


  func check5_2() {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.calendar = Calendar(identifier: .gregorian)
//    dateFormatter.calendar = Calendar(identifier: .japanese)
//    dateFormatter.calendar = Calendar(identifier: .iso8601)
//    dateFormatter.locale = Locale.current // 2023年4月7日 金曜日 午前6:46:05
    dateFormatter.locale = Locale(identifier: "en_US") // Friday, April 7, 2023 at 6:44:19 AM
//    dateFormatter.locale = Locale(identifier: "ja_JP") // 2023年4月9日 日曜日 5時49分37秒 日本標準時
//    dateFormatter.locale = Locale(identifier: "ko") // 2023년 4월 9일 일요일 오전 5시 50분 21초 일본 표준시
//    dateFormatter.locale = Locale(identifier: "zh") // 2023年4月9日 星期日 日本标准时间 05:51:08
//    dateFormatter.locale = Locale(identifier: "ar") // サウジアラビア：الأحد، ٩ أبريل، ٢٠٢٣، ٥:٤٣:٠٧ ص توقيت اليابان الرسمي
    dateFormatter.dateStyle = .short
    dateFormatter.timeStyle = .none
    let formattedDate = dateFormatter.string(from: date)
    print(formattedDate)
  }

  //  現在の日時に加算
  func check6() {
    if let date = createDate(timeZone: TimeZone.gmt, year: 2023,month: 4, day: 7, hour: 20, minute: 17,second: 38) {
      let newDate = date.addingTimeInterval(10)
      print("date: \(date), addDate:\(newDate)")
    }
    // now: 2023-04-07 20:17:38 +0000, addDate:2023-04-07 20:17:48 +0000
  }

  //  任意の日時に加算
  func check7() {
    if let date = createDate(year: 2023,month: 5,day: 1,hour: 9,minute: 0,second: 0) {
      let newDate = date.addingTimeInterval(-60)

      print("now: \(date), addDate:\(newDate)")

    }
  }
  func check8() {
    if let date = createDate(year: 2023,month: 5,day: 1,hour: 23,minute: 0,second: 0) {
      print(date) // 2023-05-10 14:00:00 +0000
    }
  }
  
  func check9_() {
    var calendar = Calendar(identifier: .gregorian)
    calendar.timeZone = TimeZone(identifier: "Asia/Tokyo") ?? TimeZone.gmt
     
    if let date = calendar.date(
      from: DateComponents(
        year: 2023,
        month: 4,
        day: 15,
        hour: 9,
        minute: 0,
        second: 0)) {
      print(date)  // 2023-04-15 00:00:00 +0000
    }
  }
  
  /// 指定日時よりDate作成
  /// - Parameters:
  ///   - timeZone: 作成する日時のTimeZone
  ///   - year: 以下作成日時
  ///   - month:
  ///   - day:
  ///   - hour:
  ///   - minute:
  ///   - second:
  /// - Returns: Date?
  func createDate(timeZone: TimeZone! = nil, year: Int? = nil, month: Int? = nil, day: Int? = nil, hour: Int? = nil, minute: Int? = nil, second: Int? = nil ) -> Date? {
    var calendar = Calendar(identifier: .gregorian)
    if timeZone != nil {
      calendar.timeZone = timeZone
    }
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

  func check10() {
    //  使用可能なIdentifiers一覧取得
    let identifiers = Locale.availableIdentifiers
    print(identifiers)
  }
  
  //  相対的な日付表現
  func doesRelativeDate() {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ja_JP")
    formatter.dateStyle = .full
    formatter.timeStyle = .none
    formatter.doesRelativeDateFormatting = true
    
    let date = Date()
    print(formatter.string(from: date))  // 今日
  }
  
  func check11() {
    let calendar = Calendar(identifier: .gregorian)
    let date = Date()
  
    // 分・秒切り捨て
    let componentsHour = calendar.dateComponents([.year, .month, .day, .hour], from: date)
    // 秒切り捨て
    let componentsMinute = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
    if let hourDate = calendar.date(from: componentsHour),
       let minuteData = calendar.date(from: componentsMinute) {
      print("date:\(date)")  // date:2023-04-08 21:32:34 +0000
      print("hourDate:\(hourDate)")  // hourDate:2023-04-08 21:00:00 +0000
      print("minuteData:\(minuteData)")  // minuteData:2023-04-08 21:32:00 +0000
    }
  }
  
  //  現在の日時に加算2
  func check12() {
    // 現在の日時
    let now = Date()
    // 加算する時間（秒）
    let addSec: Double = (60 * 60 * 25) + 60 + 1 //   1日1時間1分1秒　加算
    // 現在の日時に加算
    let addDateNow = Date(timeIntervalSinceNow: addSec)
    // 1970年1月1日 0時0分0秒 に加算
    let addDate1970 = Date(timeIntervalSince1970: addSec)
    // 2001年1月1日　0時0分0秒
    let addDateReferenceDate = Date(timeIntervalSinceReferenceDate: addSec)

    /*
    print("now: \(now)") // now: 2023-04-10 21:04:51 +0000
    print("addDateNow:\(addDateNow)") // addDateNow:2023-04-11 22:05:52 +0000
    print("addDate1970:\(addDate1970)") // addDate1970:1970-01-02 01:01:01 +0000
    print("addDateReferenceDate:\(addDateReferenceDate)") // addDateReferenceDate:2001-01-02 01:01:01 +0000
     */
    print(now) // 2023-04-10 21:12:07 +0000
    print(addDateNow) // 2023-04-11 22:13:08 +0000
    print(addDate1970) // 1970-01-02 01:01:01 +0000
    print(addDateReferenceDate) // 2001-01-02 01:01:01 +0000
  }

  func check13() {
    let now = Date()
    let limit = createDate(year: 2023,month: 4, day: 10, hour: 7)
    
    let isLimit = now < limit!
    
    print(" now:\(now)\n limit: \(limit!)\n isLimit: \(isLimit)")
    /*
     now:2023-04-08 22:09:55 +0000
     limit: 2023-04-09 22:00:00 +0000
     isLimit: true
     */
  }
  
  func check14() {
    let formatterJa = DateIntervalFormatter()
    formatterJa.dateTemplate = "ydMMMEEE"
    formatterJa.locale = Locale(identifier: "ja_JP")
    let formatterEn = DateIntervalFormatter()
    formatterEn.dateTemplate = "ydMMMEEE"
    formatterEn.locale = Locale(identifier: "en_US")

    let now = Date()
    let 今日 = Date()
    let afterTomorrow = Date(timeIntervalSinceNow: 60*60*48)
    print(formatterJa.string(from: now, to: afterTomorrow)) // 2023年4月12日(水)～14日(金)
    print(formatterEn.string(from: now, to: afterTomorrow)) // Wed, Apr 12 – Fri, Apr 14, 2023
  }
  
  /// check9のsetLocalizedDataFormatFromTemplate版
  func check15(){
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ja_JP")
    formatter.setLocalizedDateFormatFromTemplate("yyyyMMddhhssmm")
//    formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd HH:mm:ss")
    let date = Date()
    print(date)
    let strDate = formatter.string(from: date)
    print(strDate) // 2023/04/15 午後0:53:41 ja_JP
                   // 04/13/2023, 6:56:35 AM  ja_JP:2023/04/13 午前6:55:39
                   // 04/13/2023, 06:57:47 2023/04/13 7:00:24
  }
  
  func check16() {
    let formatter = ISO8601DateFormatter()
    formatter.timeZone = TimeZone.current
    
    let date = Date()
    let strDate = formatter.string(from: date)
    print(strDate) // 2023-04-13T05:47:30+09:00
  }

  func check17() {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ja_JP")
//    formatter.setLocalizedDateFormatFromTemplate("MMyyyyddssmmhh")
//    formatter.setLocalizedDateFormatFromTemplate("yyyy-MM-dd HH:mm:ss") // 2023-04-14 21:32:21 +0000
//    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //  2023-04-14 21:33:01 +0000
    formatter.dateFormat = "yyyy年MM月dd日 HH時mm分ss秒" //  2023-04-14 21:33:01 +0000

    let date = Date()
    print(date)
    let strDate = formatter.string(from: date)
    
    print(strDate)
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //  nil
    let strToDate = formatter.date(from: strDate)
    
    print(strToDate!)

  }
  
  func check() {
    check15()
  }
  //   df.calendar = Calendar(identifier: .japanese)
}
