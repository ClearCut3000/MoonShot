//
//  AstronautView.swift
//  MoonShot
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct AstronautView: View {

  //MARK: - View Properties
  var astronaut: Astronaut

  //MARK: - View Body
    var body: some View {
      ScrollView {
        VStack {
          Image(astronaut.id)
            .resizable()
            .scaledToFit()

          Text(astronaut.description)
            .foregroundColor(.white)
            .padding()
        }
      }
      .background(.darkBackground)
      .navigationTitle(astronaut.name)
      .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
    }
}
