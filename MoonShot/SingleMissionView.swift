//
//  SingleMissionView.swift
//  MoonShot
//
//  Created by Николай Никитин on 29.08.2022.
//

import SwiftUI

struct SingleMissionView: View {

  //MARK: - View Properties
  let mission: Mission

  //MARK: - View Body
  var body: some View {
    GeometryReader { geo in
      ScrollView {
        VStack {
          Image(mission.image)
            .resizable()
            .scaledToFit()
            .frame(width: geo.size.width * 0.6)
            .padding(.top)
          VStack(alignment: .leading) {
            Text("Mission Highlights")
              .font(.title.bold())
              .padding(.bottom, 5)
            Text(mission.description)
          }
          .padding(.horizontal)
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }
}

struct SingleMissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")

  static var previews: some View {
    SingleMissionView(mission: missions[0])
  }
}
