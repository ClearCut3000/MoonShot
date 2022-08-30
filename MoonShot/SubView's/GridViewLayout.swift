//
//  GridViewLayout.swift
//  MoonShot
//
//  Created by Николай Никитин on 30.08.2022.
//

import SwiftUI

struct GridViewLayout: View {
  
  //MARK: - View Properties
  var missions: [Mission]
  var astronauts: [String: Astronaut]
  let column = [
    GridItem(.adaptive(minimum: 150))
  ]
  
  //MARK: - View Body
  var body: some View {
    ScrollView {
      LazyVGrid(columns: column) {
        ForEach(missions) { mission in
          NavigationLink {
            SingleMissionView(mission: mission, astronauts: astronauts)
          } label: {
            VStack {
              Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding()

              VStack {
                Text(mission.displayName)
                  .font(.headline)
                  .foregroundColor(.white)
                Text(mission.formattedLaunchDate == "N/A" ? "Mission never flew" : mission.formattedLaunchDate)
                  .font(.caption)
                  .foregroundColor(.white.opacity(0.5))
              }
              .padding(.vertical)
              .frame(maxWidth: .infinity)
              .background(.lightBackground)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(
              RoundedRectangle(cornerRadius: 10)
                .stroke(.lightBackground)
            )
          }
        }
      }
      .padding([.horizontal, .bottom])
    }
  }
}

struct GridViewLayout_Previews: PreviewProvider {
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  
  
  static var previews: some View {
    GridViewLayout(missions: missions, astronauts: astronauts)
  }
}
