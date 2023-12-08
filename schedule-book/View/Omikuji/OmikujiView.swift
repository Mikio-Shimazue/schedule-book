//
//  OmikujiView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/05.
//

import SwiftUI

struct OmikujiView: View {
  @Binding var isPresented: Bool
  @State var isOmikuji: Bool = false
  let omikujiResults: [String] = ["omikuji_daikichi",
    "omikuji_kichi",
    "omikuji_chuukichi",
    "omikuji_syoukichi",
    "omikuji_suekichi",
    "omikuji_kyou",
    "omikuji_daikyou",
  ]
  @State var omikujiNo: Int = 0
  var body: some View {
    VStack {
      if isOmikuji == false {
        Image("omikuji-torii")
          .resizable()
          .frame(width: 200, height: 168) //  800×672
          .rotationEffect(.degrees(0))
      } else {
        Image(omikujiResults[omikujiNo])
          .resizable()
          .frame(width: 200, height: 200)
          .rotationEffect(.degrees(30))
      }
      Button(action: { withAnimation {
        self.omikujiNo = Int.random(in: 0..<omikujiResults.count)
        self.isOmikuji = true
        }
      }, label: {
        Text("おみくじ")
          .font(.headline)
          .foregroundColor(!isOmikuji ? .white : .gray)
          .padding()
          .frame(maxWidth: .infinity)
          .background(!isOmikuji ? .pink : .gray)
          .cornerRadius(12)
      })
      .disabled(isOmikuji)
    }
//    .frame(width: dialogWidth)
    .padding()
    .padding(.top)
    .background(.gray)
    .cornerRadius(12)
    .frame(alignment: .center)
    .overlay(alignment: .topTrailing) {
      CloseButton(color: .white) { withAnimation {
        isPresented = false
      }}
      .padding()
    }
  }
}

#Preview {
  @State var isPresented: Bool = false

  return OmikujiView(isPresented: $isPresented)
}
