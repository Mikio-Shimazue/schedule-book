//
//  ExtentionString.swift
//  schedule-book
//
//  Created by Mikizin on 2023/05/10.
//

import Foundation

extension String {
  func get3PointLeaderString(getCount: Int) -> String {
    if getCount < count {
      let str = prefix(getCount) + "..."
      return String(str)
    }
    return self
  }
}
