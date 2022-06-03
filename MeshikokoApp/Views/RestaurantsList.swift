//
//  RestaurantsList.swift
//  MeshikokoApp
//
//

import SwiftUI

struct RestaurantsList: View {
    
    @ObservedObject var fetcher = FetchRestaurantList()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    
                    Text("一覧")
                        .font(.system(size: 25, weight: .light, design: .serif))
                        .padding(.leading)
                    Spacer()
                    NavigationLink(destination: CreateRestaurant())
                    {
                        Image(systemName: "plus.square.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30.0, height: 30.0)
                            .padding(.trailing, 20)
                    }
                    
                }


                List (fetcher.restaurants) {
                    restaurant in
                    NavigationLink(destination: RestaurantDetail(restaurant: restaurant))
                    {
                        RestaurantRow(restaurant: restaurant)
                    }
                }
            }
        }

    }
}

struct RestaurantsList_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantsList()
    }
}
