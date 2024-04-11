//
//  ModelData.swift
//  Pool Pool Go
//
//  Created by ramiro garza on 4/3/24.
//

import SwiftUI

class ModelData: ObservableObject {
    @Published var profiles: [Profile] = load("userScores.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        let data = try Data(contentsOf: file)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't load and parse \(filename) as \(T.self):\n\(error)")
    }
}
