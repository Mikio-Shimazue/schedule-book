//
//  PopUpView.swift
//  schedule-book
//
//  Created by Mikizin on 2023/12/04.
//

import SwiftUI

/// ポップアップ表示用View
/// PopUp表示したいViewをContentとして黒透過背景のPopUpView表示する
///
struct PopUpView<Content: View>: View {
  @Binding var isPresented: Bool
  let content: Content
  let isEnabledToCloseByBackgroundTap: Bool

  init(isPresented: Binding<Bool>, isEnabledToCloseByBackgroundTap: Bool = true, @ViewBuilder _ content: () -> Content) {
    _isPresented = isPresented
    self.content = content()
    self.isEnabledToCloseByBackgroundTap = isEnabledToCloseByBackgroundTap
  }

  var body: some View {
    ZStack {
      PopUpBackgroundView()
        .onTapGesture {
          if isEnabledToCloseByBackgroundTap {
            withAnimation {
              isPresented = false
            }
          }
        }
        .transition(.opacity)
      content
    }
  }
}

#Preview {
  @State var isPresented: Bool = false

  return PopUpView(isPresented: .constant(true)) {
    OmikujiView(isPresented: $isPresented)
  }
}
