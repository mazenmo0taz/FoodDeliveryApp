//
//  MenuItemsModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//

struct MenuItem: Codable {
    let itemID: Int
    let itemName: String
    let itemDescription: String
    let itemPrice: Int
    let restaurantID: Int
    let imageUrl: String
}

