//
//  ExtentsionColor.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/22.
//

import SwiftUI

extension Color {
  static func rgb(red: Double, green: Double, blue: Double, alpha: Double = 255) -> Color {
    print(CUnsignedChar.max)
    return Color(
      red: red / Double(CUnsignedChar.max),
      green: green / Double(CUnsignedChar.max),
      blue: blue / Double(CUnsignedChar.max),
      opacity: alpha / Double(CUnsignedChar.max))
  }
}
