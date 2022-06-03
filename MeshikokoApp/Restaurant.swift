//
//  Restaurant.swift
//  MeshikokoApp
//

import Foundation
import CoreLocation
import Combine

var restaurants: [Restaurant] = load("restaurants.json")

struct Restaurant: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var CreatedAt: Date
    var UpdatedAt: Date
}

struct RestaurantList: Decodable {
    var restaurants: [Restaurant]
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
