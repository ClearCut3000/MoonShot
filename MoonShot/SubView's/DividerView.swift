//
//  DividerView.swift
//  MoonShot
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct DividerView: View {

  //MARK: - View Properties
  var text: String

  //MARK: - View Body
  var body: some View {
    HStack {
      Rectangle()
        .frame(height: 2)

      Text(text)
        .lineLimit(1)
        .font(.title.bold())
        .fixedSize()

      Rectangle()
        .frame(height: 2)
    }
    .padding(.vertical)
    .foregroundColor(.lightBackground)
    .opacity(0.8)
  }
}

struct DividerView_Previews: PreviewProvider {
  static var previews: some View {
    DividerView(text: "Divider Text Sample")
  }
}
