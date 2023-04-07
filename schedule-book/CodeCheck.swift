//
//  CodeCheck.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/02/26.
//

import Foundation


class CodeCheck {
  func check() {
    CheckDate().check()
    CheckString().check()
    CheckEnum().check()
    print(CheckProtocl(prefix: "Mr.").getPrefixName())
    print(CheckProtocl(prefix: "Mss.").nextOdd)
    let name = "jon".Mr
    print(name)
    let onInch = 25.4.mm
    let onInch2 = onInch.cm
    print(onInch)
    print(onInch2)
    let mss = String.Mss
    print(mss)
    //  var pnt = CGPoint(x:1.0,y:2.0)
    let x = Float(3)
    let y = Float(5)
    let pnt = CGPoint(x: x, y: y)
    print(pnt)
    
    let strA = "a"
    let strB = "!"
    let strC = "0"
    let a = 12_345
    
    print(a[0])
    print(a[1])
    print(a[2])
    print(a[3])
    print(a[4])
    print(a[5])
    print(a[6])
    print(a[7])
    print(a[8])
    
    strA.three()
    strA.kind()
    strB.kind()
    strC.kind()
    
    var num = 3
    
    num.repeatA()
  }
}

extension String {
  func three() {
    for _ in 0..<3 {
      print("\(self)")
    }
  }
  
  enum Kind {
    case mark, number, alphabet
  }
    
  func kindTest() -> Kind {
    let str = "A"
    let code = str.utf8
    print(code)
    
    let cstr: [CChar] = str.cString(using: .ascii)!
    
    let number = Int(cstr[0])
    print(number)
    return .mark
  }

  func kind() -> Kind {
    let cstr: [CChar] = self.cString(using: .ascii)!
    
    let code = Int(cstr[0])
    if code <= 0x2f {
      print("\(code) .mark")
      return .mark
    }
    else if code <= 0x39 {
      print("\(code) .number")
      return .number
    }
    else {
      print("\(code) .alphabet")
      return .alphabet
    }
  }
}

extension CGPoint {
  init(x: Float, y: Float) {
    self.init(x: Double(x), y: Double(y))
  }
}

extension Double {
  var mm: Double { return self / 1_000.0 }
  var cm: Double { return self * 100.0 }
}

extension String {
  var Mr: String { return "Mr." + self }
  static let Mss = String("Mss.")
}

extension Int {
  func repeatA() {
    for _ in 0..<3 {
      print("\(self)")
    }
  }

  subscript(index: Int) -> Int {
    var digit = 1
    while (self / digit) != 0 {
      digit *= 10
    }
    var jyou = Int(pow(Double(10), Double(index + 1)))
    if digit < jyou {
      return 0
    }
    return (self / (digit / jyou)) % 10
  }
}
