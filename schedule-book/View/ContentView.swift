//
//  ContentView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/04.
//

import SwiftUI

struct ContentView: View {
  @State private var shouldPresentPopUpDialog = false
  var body: some View {
    Button {
      withAnimation {
        shouldPresentPopUpDialog = true
      }
    } label: {
      Text("おみくじ")
    }
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
