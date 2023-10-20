//
//  AppDelegate.swift
//  schedule-book
//
//  Created by Mikizin on 2023/10/20.
//

import Foundation

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options:[.alert, .sound]) {(granted,error) in
      //  Enable or  disable features based on authorization
    }
    
    center.delegate = self
    return true
  }
  
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    completionHandler([.badge, .banner, .list, .sound])
  }
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSessioon: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSessioon.role)
  }
  
  
}
