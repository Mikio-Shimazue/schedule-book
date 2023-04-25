//
//  checkJsondata.swift
//  schedule-book
//
//  Created by Mikizin on 2023/04/26.
//

import Foundation

/// 店舗グループデータ
struct ShopGroup: Codable {
  /// 店舗グループ名
  var name: String
  /// 店舗情報リスト
  var shopList: [Shop]
  /// 最終更新日
  var updateDate: Date?
  enum CodingKeys: String,CodingKey {
    case name
    case shopList = "shop_list"
    case updateDate = "update_date"
  }
}

/// 店舗データ
struct Shop: Codable {
  /// コード
  var code: String
  /// 名前
  var name: String
  /// 住所
  var address: String
  /// 種別
  var kind: Int
  /// おすすめ内容
  var recommend: String?
  ///  最終更新日
  var updateDate: Date?
  enum CodingKeys: String,CodingKey {
    case code
    case name
    case address
    case kind
    case recommend
    case updateDate = "update_date"
  }

}


class jsonTest {
  func forJson(){
    let okazakiShoppingMall = ShopGroup ( name: "岡崎ショッピングモール", shopList: [
      Shop(code: "001", name: "yakiniku家", address: "岡崎市明大寺長", kind: 1, recommend: "ハラミステーキ", updateDate: Date()),
      Shop(code: "002", name: "伊太利亜麺家", address: "岡崎市明大寺長", kind: 1, updateDate: Date()),
      Shop(code: "003", name: "中華麺家", address: "岡崎市明大寺長", kind: 1, updateDate: Date()),
    ])

    //  JSONへ変換
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted //  出力整形
    encoder.dateEncodingStrategy = .iso8601 // Dateフォーマット指定
    guard let jsonValue = try? encoder.encode(okazakiShoppingMall) else {
      fatalError("Failed to encode to JSON")
    }
    
    print(String(bytes: jsonValue, encoding: .utf8))

    /*
    //   .prettyPrintedなしの場合→ encoder.outputFormatting = .prettyPrinted //  出力整形
     "{\"name\":\"岡崎ショッピングモール\",\"shop_list\":[{\"code\":\"001\",\"kind\":1,\"update_date\":\"2023-04-25T21:10:25Z\",\"name\":\"yakiniku家\",\"recommend\":\"ハラミステーキ\",\"address\":\"岡崎市明大寺長\"},{\"code\":\"002\",\"kind\":1,\"update_date\":\"2023-04-25T21:10:25Z\",\"name\":\"伊太利亜麺家\",\"address\":\"岡崎市明大寺長\"},{\"code\":\"003\",\"kind\":1,\"update_date\":\"2023-04-25T21:10:25Z\",\"name\":\"中華麺家\",\"address\":\"岡崎市明大寺長\"}]}"
    //   .prettyPrintedありの場合→ encoder.outputFormatting = .prettyPrinted //  出力整形
     "{\n  \"name\" : \"岡崎ショッピングモール\",\n  \"shop_list\" : [\n    {\n      \"code\" : \"001\",\n      \"kind\" : 1,\n      \"update_date\" : \"2023-04-25T21:08:33Z\",\n      \"name\" : \"yakiniku家\",\n      \"recommend\" : \"ハラミステーキ\",\n      \"address\" : \"岡崎市明大寺長\"\n    },\n    {\n      \"code\" : \"002\",\n      \"kind\" : 1,\n      \"update_date\" : \"2023-04-25T21:08:33Z\",\n      \"name\" : \"伊太利亜麺家\",\n      \"address\" : \"岡崎市明大寺長\"\n    },\n    {\n      \"code\" : \"003\",\n      \"kind\" : 1,\n      \"update_date\" : \"2023-04-25T21:08:33Z\",\n      \"name\" : \"中華麺家\",\n      \"address\" : \"岡崎市明大寺長\"\n    }\n  ]\n}"
    */
    //  JSONから変換
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .iso8601 // Dateフォーマット指定
    guard let shopGroup: ShopGroup = try? decoder.decode(ShopGroup.self, from: jsonValue) else {
      fatalError("Failed to decode from JSON.")
    }
    
    print(shopGroup)
    /*
     hopGroup(name: "岡崎ショッピングモール", shopList: [schedule_book.Shop(code: "001", name: "yakiniku家", address: "岡崎市明大寺長", kind: 1, recommend: Optional("ハラミステーキ"), updateDate: Optional(2023-04-25 21:00:49 +0000)), schedule_book.Shop(code: "002", name: "伊太利亜麺家", address: "岡崎市明大寺長", kind: 1, recommend: nil, updateDate: Optional(2023-04-25 21:00:49 +0000)), schedule_book.Shop(code: "003", name: "中華麺家", address: "岡崎市明大寺長", kind: 1, recommend: nil, updateDate: Optional(2023-04-25 21:00:49 +0000))], updateDate: nil)
     (lldb)
     */
    /*
    for shop in shopGroup.shopList {
      print(shop)
    }
     */
  }
}

//  サーバーからのJSON読出し例
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
