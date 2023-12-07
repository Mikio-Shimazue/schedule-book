//
//  PopUpBackgroundView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/04.
//

import SwiftUI

struct PopUpBackgroundView: View {
  let color: Color
  init(color: Color = Color.black.opacity(0.7)) {
    self.color = color
  }
  var body: some View {
    color
      .edgesIgnoringSafeArea(.all)
  }
}

#Preview {
  PopUpBackgroundView()
}
