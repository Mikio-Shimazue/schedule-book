//
//  CheckProtocol.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/02/26.
//

import Foundation

protocol PrefixProtocol {
  var firstname: String { set get }
  var prefix:String{ get }
  init(prefix: String)
}

protocol OddNumber {
  var number: Int{set get}
  var nextOdd: Int{ get }
}
class CheckProtocl: PrefixProtocol,OddNumber{
  
  var firstname: String = "Jon"
  var prefix: String = "Mr."
  var number: Int = 2
  var nextOdd: Int{
    get{
      if 0 != number % 2 {
        return number + 2
      }
      return number + 1
    }
    
  }
  
  required init(prefix: String){
    self.prefix = prefix
  }

  func getPrefixName() -> String{
    return prefix + firstname
  }
  
  
}
