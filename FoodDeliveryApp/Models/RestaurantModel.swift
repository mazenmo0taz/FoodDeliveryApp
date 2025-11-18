//
//  RestaurantModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import Foundation
struct Restaurant:Decodable,Identifiable {
    var id = UUID()
    var restaurantID: Int
    var name: String
    var image: String
    var rating: Double
    var timeToDeliver: Int
    var deliveryFee: Int
    var haveDiscount: Bool
    var isFavorite: Bool
}

struct APIRestaurantData:Decodable {
    var id: Int
    var name: String
    enum CodingKeys: String, CodingKey {
        case id = "restaurantID"
        case name = "restaurantName"
    }
}
