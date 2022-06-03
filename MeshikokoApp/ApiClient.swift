//
//  FetchRestaurantList.swift
//  MeshikokoApp
//

import Foundation

class MeshikokoApiClient: ObservableObject {
    // このプロパティに変更があった際にイベント発行
    @Published var restaurants: [Restaurant] = []

    init() {

    }

    class func Request(url: String, success: @escaping(Data) -> Void) {
        let request_url = config.api_base_url + url
        print("requesting: \(request_url)")
        URLSession.shared.dataTask(with: URL(string: request_url)!) { (data, response, error) in
            guard let data = data else { return }
            success(data)
        }.resume()
    }
}
