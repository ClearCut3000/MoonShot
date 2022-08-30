//
//  ListViewLayout.swift
//  MoonShot
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct ListViewLayout: View {

  //MARK: - View Properties
  var missions: [Mission]
  var astronauts: [String: Astronaut]

  //MARK: - View Body
  var body: some View {
    List {
      ForEach(missions) { mission in
        NavigationLink {
          SingleMissionView(mission: mission, astronauts: astronauts)
        } label: {
          HStack() {
            Image(mission.image)
              .resizable()
              .frame(width: 40, height: 40)
              .scaledToFill()
              .padding(5)

            Text(mission.displayName)
              .font(.title2)
              .foregroundColor(.white)
              .padding(5)

            Text(mission.formattedLaunchDate == "N/A" ? "Mission never flew" : mission.formattedLaunchDate)
              .font(.caption)
              .foregroundColor(.white.opacity(0.5))
              .padding(5)

              .background(.darkBackground)
              .clipShape(RoundedRectangle(cornerRadius: 10))
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(.lightBackground)
          .clipShape(RoundedRectangle(cornerRadius: 10))
          .overlay(
            RoundedRectangle(cornerRadius: 10)
              .stroke(.lightBackground)
          )
        }
      }
      .listRowBackground(Color(red: 0.1, green: 0.1, blue: 0.2))
    }
    .background(.darkBackground)
  }
}

struct ListViewLayout_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  static let missions: [Mission] = Bundle.main.decode("missions.json")

  static var previews: some View {
    ListViewLayout(missions: missions, astronauts: astronauts)
  }
}
