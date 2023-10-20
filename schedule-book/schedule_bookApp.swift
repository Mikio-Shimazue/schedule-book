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
    WindowGroup {
      //  ContentView()
      CalendarView()
    }
  }
}
