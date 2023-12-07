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
      ZStack{
        Image("22395020")
          .resizable()
          .aspectRatio(contentMode: .fill)
          .edgesIgnoringSafeArea(.all)
        
        ContentView()
//        CalendarView()
          .background(Color.white.opacity(0))
          .frame(width: width)
      }
    }
  }
}
