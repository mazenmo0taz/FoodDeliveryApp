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


struct MenuItemm: Identifiable, Codable {
    let id: String
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id = "itemID"
        case name = "itemName"
        case description = "itemDescription"
        case price = "itemPrice"
        case imageURL = "imageUrl"
    }
}
