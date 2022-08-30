//
//  MissionsView.swift
//  MoonShot
//
//  Created by Николай Никитин on 28.08.2022.
//

import SwiftUI

struct MissionsView: View {
  //MARK: - View Properties
  let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
  let missions: [Mission] = Bundle.main.decode("missions.json")
  let column = [
    GridItem(.adaptive(minimum: 150))
  ]
  @State private var isShowingGrid = true

  //MARK: - View Body
  var body: some View {
    NavigationView {
      Group {
        if isShowingGrid {
          GridViewLayout(missions: missions, astronauts: astronauts)
        } else {
          ListViewLayout(missions: missions, astronauts: astronauts)
        }
      }
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          Button {
            isShowingGrid.toggle()
          } label: {
            Image(systemName: isShowingGrid ? "list.bullet.circle" : "circle.grid.3x3.circle")
              .foregroundColor(isShowingGrid ? .red : .green)
          }
        }
      }
      .navigationTitle("Moonshot")
      .preferredColorScheme(.dark)
      .background(.darkBackground)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MissionsView()
  }
}
