//
//  MenuItemsModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 17/11/2025.
//
import SwiftUI
struct MenuItem: Codable {
    //var id = UUID()
    let itemID: Int
    let itemName: String
    let itemDescription: String
    let itemPrice: Int
    let restaurantID: Int
    let imageUrl: String
}

extension MenuItem: Identifiable {
    var id: Int { itemID }
}

