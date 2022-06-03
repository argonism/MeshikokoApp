//
//  FetchRestaurantList.swift
//  MeshikokoApp
//

import Foundation

extension DateFormatter {
    /// ミリ秒付きのiso8601フォーマット e.g. 2019-08-22T09:30:15.000+0900
    static let iso8601Full: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
}

class FetchRestaurantList: ObservableObject {

    // connpass's event search API
    private let urlLink = "http://localhost:3000/v1/restaurants"
    // このプロパティに変更があった際にイベント発行
    @Published var restaurants: [Restaurant] = []

    init() {
        fetchRestaurantList()
    }

    func fetchRestaurantList() {

        let setRestaurants = {(data: Data) -> Void in
            let decoder: JSONDecoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(.iso8601Full)
            do {
                let restaurantList = try decoder.decode([Restaurant].self, from: data)
                DispatchQueue.main.async {
                    self.restaurants = restaurantList
                    print("fetch done")
                }
            } catch {
                dump(error)
                print("json convert failed in JSONDecoder. " + error.localizedDescription)
            }
            
        }
        MeshikokoApiClient.Request(url: "restaurants", success: setRestaurants)

    }
}
