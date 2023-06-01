//
//  CalendarCellItem.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/07.
//

import SwiftUI

struct CalendarCellItem: View {
  private let symbol: String
  private let color: Color
  private let backgroundColor: Color
  private let baseLength: CGFloat
  private let imageWidth: CGFloat
  private let dayViewModel = DayDetailViewModel()
  // "square.and.arrow.up"
  init(day: Date? = nil, symbol: String = "", color: Color, backgroundColor: Color){
    self.symbol = symbol
    self.color = color
    self.backgroundColor = backgroundColor
    baseLength = UIScreen.main.bounds.width / 8.5
    imageWidth = baseLength
    if let day = day {
      dayViewModel.setDay(date: day)
    }
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
              
              ForEach(dayViewModel.schedules) { schedule in
                if let title = schedule.information {
                  Text(title.get3PointLeaderString(getCount: 5))
                    .font(.system(size:8))
                }
              }
            },
            alignment: .top
          )
      }
      .frame(width: baseLength, height: 80)
    }
  }
}

struct CalendarCellItem_Previews: PreviewProvider {
  static var previews: some View {
    CalendarCellItem(color: Color(red: 0.9, green: 0.9, blue: 0.9), backgroundColor: .white)
  }
}

