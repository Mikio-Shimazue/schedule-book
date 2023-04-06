//
//  CheckEnum.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/02/28.
//

import Foundation

enum Month: CaseIterable {
  case January
  case February
  case March
  case April
  case Mya
}


class CheckEnum {
  func check(){
    for month in Month.allCases {
      print("\(month)です")
    }
    print(Month.January)
  }
}
