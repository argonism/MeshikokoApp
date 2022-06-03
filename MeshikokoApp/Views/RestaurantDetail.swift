//
//  RestaurantDetail.swift
//  MeshikokoApp
//
//

import SwiftUI
import MapKit

struct RestaurantDetail: View {
    var restaurant: Restaurant

    var body: some View {
        ScrollView {
            let coordinate = CLLocationCoordinate2D(
                latitude: 36.10682809924699,
                longitude: 140.10196417373632
            )
            MapView(coordinate: coordinate)

            HStack(alignment: .bottom) {
                Image("twinlake")
                    .resizable()
                    .scaledToFit()
                    .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 7)
                    .padding(.trailing, 50)
                Text(restaurant.name)
            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .offset(y: -20)


            Divider()
            
            
        }
    }
}

struct RestaurantDetail_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetail(restaurant: restaurants[0])
    }
}
