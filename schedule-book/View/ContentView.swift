//
//  ContentView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/04.
//

import SwiftUI

struct ContentView: View {
  @State private var shouldPresentPopUpDialog = !LastStartupDateViewModel().isSameAsPreviousDate
  var body: some View {
    CalendarView()
    if shouldPresentPopUpDialog {
      PopUpView(isPresented: $shouldPresentPopUpDialog) {
        OmikujiView(isPresented: $shouldPresentPopUpDialog)
      }
    }
  }
}

#Preview {
    ContentView()
}
