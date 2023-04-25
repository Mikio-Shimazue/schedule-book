//
//  checkJsondata.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/26.
//

import Foundation

class jsonCheck {

  func readJson() {
    let url = URL(string: "<http://example.com/data>")!
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("Error:\\(error")
      } else if let data = data {
        do {
          let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
          if let jsonDict = jsonObject as? [String: Any] {
            
          }
        } catch {
          print("Error: \(error)")
        }
      }
    }
    task.resume()
  }
// MappableはJsonを扱うための外部ライブラリ
// https://github.com/Hearst-DD/ObjectMapper
/*
 struct shop: Mappable {
 var id: Int = 0
 var name: String?
 var address: String?
 var photos: [Photo]?
 init?(map: Map){}
 
 mutating func mapping(map: Map) {
 }
 }
 */

  
}
