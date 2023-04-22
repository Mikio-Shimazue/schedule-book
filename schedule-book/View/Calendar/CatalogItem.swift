//
//  CatalogItem.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/07.
//

import SwiftUI

struct CatalogItem: View {
  private let symbol: String
  private let color: Color
  private let backgroundColor: Color
  private let baseLength: CGFloat
  private let imageWidth: CGFloat
  // "square.and.arrow.up"
  init(symbol: String = "", color: Color, backgroundColor: Color){
    self.symbol = symbol
    self.color = color
    self.backgroundColor = backgroundColor
    baseLength = UIScreen.main.bounds.width / 8.5
    imageWidth = baseLength
  }
  var body: some View {
    VStack(alignment: .center) {
      ZStack{
        RoundedRectangle(cornerRadius:2)
          .foregroundColor(backgroundColor)
        
        RoundedRectangle(cornerRadius: 2)
          .stroke(.gray, lineWidth: 0.5)

        Image(systemName: symbol)
          .resizable()
          .scaledToFit()
          .frame(width: baseLength,height: 80)
          .foregroundColor(color)
          .overlay(
            VStack {
              Text(symbol)
                .frame(height:35, alignment: .top)
                .multilineTextAlignment(.center)
                .font(.caption)
            },
            alignment: .top
          )
      }
      .frame(width: baseLength, height: 80)
    }
  }
}

struct CatalogItem_Previews: PreviewProvider {
  static var previews: some View {
    CatalogItem(color: Color(red: 0.9, green: 0.9, blue: 0.9), backgroundColor: .white)
  }
}

