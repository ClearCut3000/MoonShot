//
//  ContentView.swift
//  MoonShot
//
//  Created by Николай Никитин on 28.08.2022.
//

import SwiftUI

struct ContentView: View {
  //MARK: - View Properties
  let astronauts = Bundle.main.decode("astronauts.json")

  //MARK: - View Body
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
