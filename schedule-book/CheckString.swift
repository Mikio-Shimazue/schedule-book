//
//  CheckString.swift
//  schedule-book
//
//  Created by 島津江幹雄 on 2023/03/07.
//

import Foundation
import SwiftUI


class CheckString {
  
  public func check1(){
    let str = "FIGHT!!太郎"
    print(str.uppercased())
    print(str.lowercased())

  }
  static public func check2(){
    var str = "しまーぶろぐ"
    
    if let index = str.firstIndex(of: "ま")?.utf16Offset(in: str) {
//    if let index = str.firstIndex(of: "ま")?.utf16Offset(in: str) {
      print(index)
      //  先頭から指定インデックスの前まで削除
      str.removeFirst(index)
    }
    print(str)

  }
  public func check3(){
    let str = "しまーぶろぐ"
    
    print(String(str.map{$0}[1...2]))

  }
  public func check4(){
    let str = "しまーぶろぐ"

    print(str.hasPrefix("しまー"))
    print(str.hasPrefix("まー"))
    // true
    // false
  }
  public func check5(){
    let str = "count"
    print(str.count)
//    print(str.characters.count) // 'characters' is unavailable: Please use String directly
    // 5
  }
  public func check6(){
    let firstName = "ichirou"
    let lastName = "Shimmer"
    let fullName = firstName + " " + lastName
    print(fullName) // "ichirou Shimmer"
  }
  
  public func check7(){
    var name = "ichirou"
    name.append(" Shimmer")
    print(name)
  }
  
  public func check8(){
    let sentence = "The quick brown fox jumps over the lazy dog"
    let words = sentence.split(separator: " " )
    print(words)
  }
  
  public func check9(){
    let str = "帽子"
    let hat = "帽子"
    let grove = "手袋"
    
    if str == hat {
      print("同じ")
    } else {
      print("違う")
    }
    
    if str == grove {
      print("同じ")
    } else {
      print("違う")
    }
  }
  
  public func check10() {
    enum MotionState: String {
      case front
      case back
      case right
      case left
    }
    
    let nowState = "back"
    if nowState == MotionState.front.rawValue {
      print("nowStateは前進")
    } else if nowState == MotionState.back.rawValue {
      print("nowStateは後退")
    }
  }
  
  public func check11() {
    let str = "しまーぶろぐ"
    print(str.hasPrefix("しまー"))
    print(str.hasPrefix("まー"))
  }
  
  public func check12() {
    let str = "しまーぶろぐ"
    print(str.hasSuffix("ぶろぐ"))  // true
    print(str.hasSuffix("ぶろ"))   // false
    print(str.hasSuffix("ぶぐ"))   // false
    print(str.hasSuffix("ろぐ"))   // true
    print(str.hasSuffix("ぐ"))     // true

  }
  
  public func check13() {
    let message = "The password must be at least 8 characters long"
    let hasPassword = message.contains("password")
    print(hasPassword)  // true
    print(message.contains("This"))  // false
  }

  public func check14() {
    let str = "隣の客はよく柿食う客だ"
    if let index = str.firstIndex(of: "客")?.utf16Offset(in: str) {
      print(index)
    }
  }
  public func check15() {
    let str = "隣の客はよく柿食う客だ"
    if let index = str.lastIndex(of: "客")?.utf16Offset(in: str) {
      print(index)
    }
  }
  public func check16() {
    let str = "さらだでげんき"
    let charArray = Array(str)
    
    print(charArray)
  }
  
  public func check17() {
    let str = "さらだ,で,げんき"
    var array = str.split(separator: ",")
    print(array)
    array = str.split(separator: ",で,")
    print(array)
  }

  public func check18() {
    let str = "でさらだ,で,でげんきで"
    // 文字列で区切りたかったが文字列ではなく、複数の文字で区切るとなる。また区切った箇所に空配列が存在する
    let array = str.components(separatedBy: CharacterSet(charactersIn: ",で"))
    print(array) // ["さらだ", "", "", "げんき"]
  }

  public func check19() {
    let str = "さらだ で げんき"
    // 文字列で区切りたかったができない
    var array = str.components(separatedBy: CharacterSet(charactersIn: " "))
    print(array) // ["さらだ", "で", "げんき"]
    array = str.components(separatedBy: " ")
    print(array) // ["さらだ", "で", "げんき"]
  }

  public func check20() {
    let num = 10
    print("case1 : " + String(num))
    print("case2 : " + num.description)
  }

  public func check21() {
    let str = "10"
    let num = Int(str)!
    print(num)
  }
  
  public func check22() {
    let str = "FIGHT!!花子"
    print(str.lowercased())  // fight!!花子
  }
  
  public func check23() {
    let str = "fight!!太郎"
    print(str.uppercased())  // FIGHT!!太郎
  }
  
  public func check24() {
    let str = "ひらがな"
    let result = str.applyingTransform(.hiraganaToKatakana, reverse: false)!
    print(result)  // ヒラガナ
  }
  
  public func check25() {
    let str = "カタカナー"
    let result = str.applyingTransform(.hiraganaToKatakana, reverse: true)!
    print(result)  // かたかなあ
  }
  
  public func check26() {
    let str = "にんじん"
    let changeStr = str.replacingOccurrences(of: "じ", with: "げ")
    print(changeStr)  // にんげん
  }
  
  public func check27() {
    let str = "さらだでげんき"
    var changeStr = str.replacingOccurrences(of: "で", with: "")
    print(changeStr)  // さらだげんき
    changeStr = str.replacingOccurrences(of: "だで", with: "")
    print(changeStr)  // さらげんき
    changeStr = str.replacingOccurrences(of: "だげ", with: "")
    print(changeStr)  // さらげんき
  }
  
  public func check28() {
    var str = " さらだでげんき "
    var changeStr = str.trimmingCharacters(in: .whitespaces)
    print(changeStr)
    
    str = "\n\nさらだでげんき\n\n"
    changeStr = str.trimmingCharacters(in: .newlines)
    print(changeStr)

    str = "　\n\nさらだでげんき\n\n "
    changeStr = str.trimmingCharacters(in: .whitespacesAndNewlines)
    print(changeStr)

  }
  
  public func check29() {
    let str = "しまーぶろぐ"
    print(str.prefix(1))  // し
  }
  
  public func check30() {
    let str = "しまーぶろぐ"
    print(str.suffix(1))  // ぐ
  }
  
  public func check31() {
    let str = "しまーぶろぐ"
    print(str.suffix(str.count - 2))  // ーぶろぐ
  }

  public func check32() {
    let str = "しまーぶろぐ"
    print(str.prefix(str.count - 2))  // しまーぶ
  }
  
  public func check33() {
    var str = "しまーぶろぐ"
    let index = 3
    
    str.removeFirst(index)
    print(str) // ぶろぐ
  }
  
  public func check34() {
    let str = "しまーぶろぐ"
    let changeStr = String(str.map{$0}[1...2])
    
    print(changeStr)  // まー
  }
  
  public func check35() {
    let str = "しまーぶろぐ"
    print(str.dropFirst(2))  // ーぶろぐ
    print(str.dropFirst(3))  // ぶろぐ
  }
  
  public func check36() {
    let str = "しまーぶろぐ"
    print(str.dropLast(2))  // しまーぶ
    print(str.dropLast(3))  // しまー
  }
  
  public func check37() {
    let num = 123
    let str = String(format: "%05d", num)
    print(str)  // 00123
  }
  
  public func check38() {
    let num = 123.1
    let str = String(format: "%0.5f", num)
    print(str)  // 123.10000
  }
  
  public func check39() {
    let str = "・第一章\n　其の壱"
    print(str)
    /* ・第一章
    　其の壱
    */
  }
  
  public func check40() {
    var sentence = "南極にホッキョクグマは居る？"
    if let range = sentence.range(of: "ホッキョク") {
      print(sentence[range])  // ホッキョク
    }
  }

  public func check41() {
    var sentence = "南極にホッキョクグマは居る？"
    if let range = sentence.range(of: "ホッキョク") {
      sentence.removeSubrange(range)
      print(sentence)  // 南極にグマは居る？
    }
  }

  public func check42() {
    var sentence = "南極にホッキョクグマは居る？"
    if let range = sentence.range(of: "ホッキョク") {
      sentence.replaceSubrange(range, with: "ナンキョク")
      print(sentence)  // 南極にナンキョクグマは居る？
    }
  }

  public func check43() {
    let fruits = [ "リンゴ", "桃", "パイナップル" , "いちご", "メロン"]
    let threeString = fruits.filter{ $0.count == 3 }
    print(threeString) // ["リンゴ", "いちご", "メロン"]
  }

  public func check44() {
    let fruits = [ "リンゴ", "桃", "パイナップル" , "いちご", "メロン"]
    let firstThreeString = fruits.first{ $0.count == 3 }!
    print(firstThreeString) // "リンゴ"
  }

  
  public func check(){
    check19()
  }

}
