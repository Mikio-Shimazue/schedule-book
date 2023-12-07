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
  var body: some View {
    VStack {
      if isOmikuji == false {
        Image("omikuji-torii")
          .resizable()
          .frame(width: 200, height: 200)
          .rotationEffect(.degrees(0))
      } else {
        Image("omikuji_daikichi")
          .resizable()
          .frame(width: 200, height: 200)
          .rotationEffect(.degrees(30))
      }
      Button(action: { withAnimation {
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
