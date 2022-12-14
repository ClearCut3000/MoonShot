//
//  Mission.swift
//  MoonShot
//
//  Created by Николай Никитин on 28.08.2022.
//

import Foundation

struct Mission: Codable, Identifiable {
  struct CrewRole: Codable {
    let name: String
    let role: String
  }

  let id: Int
  let launchDate: Date?
  let crew: [CrewRole]
  let description: String
  let badge: String

  var displayName: String {
    "Apollo \(id)"
  }

  var image: String {
    "apollo\(id)"
  }

  var formattedLaunchDate: String {
    launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
  }
}
