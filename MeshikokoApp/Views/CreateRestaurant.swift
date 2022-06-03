//
//  CreateRestaurant.swift
//  MeshikokoApp
//

import SwiftUI

struct RestaurantForm: Hashable, Codable {
    var name: String = ""
}

struct CreateRestaurant: View {
    @State var restaurantForm = RestaurantForm()
    
    var body: some View {
        NavigationView {
            Form {
                TextField("お店の名前", text: $restaurantForm.name)
                Text("お店の名前 \(restaurantForm.name)")
                Section {
                    Button(action: {SendCreateRequest(restaurantForm)}) {
                        Text("登録")
                    }
                }

            }
            .navigationBarTitle("お店を登録する")
        }
    }
    
    func SendCreateRequest(_ restaurant: RestaurantForm) {
        let apiURL = "http://localhost:3000/v1/restaurant"
        guard let url = URL(string: apiURL) else { return }
        
        let encoder = JSONEncoder()
        guard let httpBody = try? encoder.encode(restaurant) else {
            fatalError("Failed to encode to JSON.")
        }
        print(String(data: httpBody, encoding: .utf8)!)

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = httpBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")  //jsonでヘッダーに付与
        
        URLSession.shared.dataTask(with: request) {(data, response, error) in

            if let error = error {
                print("Failed to get item info: \(error)")
                return;
            }

            if let response = response as? HTTPURLResponse {
                if !(200...299).contains(response.statusCode) {
                    print("Response status code does not indicate success: \(response.statusCode)")
                    return
                }
            }
        }.resume()
    }
}

struct CreateRestaurant_Previews: PreviewProvider {
    static var previews: some View {
        CreateRestaurant()
    }
}
