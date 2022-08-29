//
//  Extension+Bundle-Decodable.swift
//  MoonShot
//
//  Created by Николай Никитин on 28.08.2022.
//

import Foundation

#warning("Generic")

extension Bundle {
  func decode<T: Codable>(_ file: String) -> T {
    guard let url = self.url(forResource: file, withExtension: nil) else {
      fatalError("Failed to locate \(file) in bundle!")
    }
    guard let data = try? Data(contentsOf: url) else {
      fatalError("Failed to load \(file) in bundle!")
    }

    let decoder = JSONDecoder()
    let formatter = DateFormatter()
    formatter.dateFormat = "y-MM-dd"
    decoder.dateDecodingStrategy = .formatted(formatter)

    guard let loaded = try? decoder.decode(T.self, from: data) else {
      fatalError("Failed to decode \(file) from bundle!")
    }
    return loaded
  }
}
