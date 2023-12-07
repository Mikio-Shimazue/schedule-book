//
//  CloseButton.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/04.
//

import SwiftUI

struct CloseButton: View {
  let fontSize: CGFloat
  let weight: Font.Weight
  let color: Color
  let action: () -> Void
  
  init(fontSize: CGFloat = 24, weight: Font.Weight = .bold, color: Color = .black, action: @escaping () -> Void ) {
    self.fontSize = fontSize
    self.weight = weight
    self.color = color
    self.action = action
  }
  
  var body: some View {
    Button {
      action()
    } label: {
      Image(systemName: "xmark.circle")
    }
    .font(.system(size: fontSize,
                  weight: weight,
                  design: .default))
    .foregroundColor(color)
  }
}

#Preview {
  CloseButton(fontSize: 24, weight: .bold, color: .black.opacity(0.7)) {
    Text("")
  }
}
