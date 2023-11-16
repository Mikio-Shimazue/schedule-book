//
//  schedule_bookApp.swift
//  schedule-book
//
//  Created by 島Work on 2023/02/13.
//

import SwiftUI

@main
struct schedule_bookApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  var body: some Scene {
    let bounds = UIScreen.main.bounds
    let width = CGFloat(bounds.width)
    let height = CGFloat(bounds.height)
    WindowGroup {
      Text("\(width) / \(height)")
      //  ContentView()
      CalendarView()
        .frame(width: width,height: height)
        .background(Color.cyan)
    }
  }
}
