//
//  SingleMissionView.swift
//  MoonShot
//
//  Created by Николай Никитин on 29.08.2022.
//

import SwiftUI

struct SingleMissionView: View {

  //MARK: - View Properties
  struct CrewMember {
    let role: String
    let astronaut: Astronaut
  }
  let mission: Mission
  let crew: [CrewMember]

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
            .accessibilityLabel(mission.badge)

          Text(mission.formattedLaunchDate == "N/A" ? "Mission never flew" : mission.formattedLaunchDate)
            .lineLimit(1)
            .font(.title.monospaced())
            .fixedSize()
            .padding(.vertical, 5)
            .foregroundColor(.lightBackground)
            .opacity(0.8)

          DividerView(text: "Mission Highlights")

          VStack(alignment: .leading) {
            Text(mission.description)

            DividerView(text: "Crew")
          }
          .padding(.horizontal)

          ScrollView(.horizontal, showsIndicators: false) {
            HStack {
              ForEach(crew, id: \.role) { crewMember in
                NavigationLink {
                  AstronautView(astronaut: crewMember.astronaut)
                } label: {
                  HStack {
                    Image(crewMember.astronaut.id)
                      .resizable()
                      .frame(width: 104, height: 72)
                      .clipShape(Capsule())
                      .overlay(
                        Capsule()
                          .strokeBorder(.white, lineWidth: 1)
                      )
                    VStack(alignment: .leading) {
                      Text(crewMember.astronaut.name)
                        .foregroundColor(.white)
                        .font(.headline)
                        .accessibilityLabel(crewMember.astronaut.name.replacingOccurrences(of: ".", with: " "))
                      Text(crewMember.role)
                        .foregroundColor(.secondary)
                    }
                  }
                  .padding(.horizontal)
                }
              }
            }
          }
        }
        .padding(.bottom)
      }
    }
    .navigationTitle(mission.displayName)
    .navigationBarTitleDisplayMode(.inline)
    .background(.darkBackground)
  }

  //MARK: - View Init
  init(mission: Mission, astronauts: [String: Astronaut]) {
    self.mission = mission
    self.crew = mission.crew.map { member in
      if let astronaut = astronauts[member.name] {
        return CrewMember(role: member.role, astronaut: astronaut)
      } else {
        fatalError("Missing \(member.name)")
      }
    }
  }
}

struct SingleMissionView_Previews: PreviewProvider {
  static let missions: [Mission] = Bundle.main.decode("missions.json")
  static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  static var previews: some View {
    SingleMissionView(mission: missions[0], astronauts: astronauts)
      .preferredColorScheme(.dark)
      .previewInterfaceOrientation(.portrait)
  }
}
