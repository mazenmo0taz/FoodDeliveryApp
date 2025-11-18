//
//  CategoriesModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import Foundation
struct Categories: Identifiable {
    var id = UUID()
    let name: String
}

struct CategsMockData{
    
static let categories: [Categories] = [
        .init(name: "Fast Food"),
        .init(name: "Dessert"),
        .init(name: "Drinks"),
        .init(name: "Beverages"),
        .init(name: "Snacks"),
        .init(name: "Meat"),
        .init(name: "Seafood"),
    ]
}
