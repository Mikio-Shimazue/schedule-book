//
//  ScheduleNotification.swift
//  schedule-book
//
//  Created by Mikizin on 2023/10/19.
//

import Foundation
import UserNotifications


class ScheduleNotification {
 
  func setScheduleNotification(_ identifier: String, _ date: Date) {
    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { [unowned self] authorized, error in
      if let error = error {
        print("error: \(error)")
        return
      }
      
      print("authorized:\(authorized)")
      
      
      DispatchQueue.main.async {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Test"
        notificationContent.body = "Test Body"
        notificationContent.sound = .default
        notificationContent.badge = 1
        
        var dateComponents = DateComponents()
        dateComponents.year = Calendar.current.component(.year, from: date)
        dateComponents.month = Calendar.current.component(.month, from: date)
        dateComponents.day = Calendar.current.component(.day, from: date)
        
        dateComponents.hour = Calendar.current.component(.hour, from: date)
        dateComponents.minute = Calendar.current.component(.minute, from: date)
        dateComponents.calendar = Calendar.current
        dateComponents.timeZone = TimeZone.current
        
        print("dateComponents: \(dateComponents)")
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: notificationContent, trigger: trigger)
        print("UNNotificationRequest Identifiers:\(identifier)")

        UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
            print("error: \(error)")
          }
          else {
            print("schedule succeeded!")
          }
        }
      }
    }
  }
  
  func deleteNotification(_ identifier: String,_ date: Date) {
    logoutNotifications()

    print("DeleteNotification Identifiers:\(identifier)")
    //  登録されている通知を削除
    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    
    // 登録通知を確認
    logoutNotifications()
  }
  
  // 登録されている通知を確認(log出力)
  func logoutNotifications() {
    return
    /*
    UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
      for notification in notifications {
        print("DELETE before :Pending requests : ", notification)
      }
    }
     */
  }
}
