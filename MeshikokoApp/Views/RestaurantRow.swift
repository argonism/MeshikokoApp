//
//  RestaurantRow.swift
//  MeshikokoApp
//
//

import SwiftUI

struct RestaurantRow: View {
    var restaurant: Restaurant

    var body: some View {
        HStack {
            Text(String(restaurant.id))
            Text(restaurant.name)
        }
    }
}

struct RestaurantRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantRow(restaurant: restaurants[1])
    }
}
