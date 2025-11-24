//
//  RestaurantDetailViewModel.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import Foundation
import SwiftUI
@Observable
class RestaurantDetailViewModel: ObservableObject {
    var restaurant: Restaurant?
    var menuItems: [MenuItem] = []
    var restaurantImage:Image?
    var selectedMenuTab = "Order again"
    var selectedMenuItem:MenuItem?
    var isDataloading:Bool{
        if menuItems.count >= 3{
            return false
        }else{
            return true
        }
    }
    let promosArray = [
        PromoCrad(text: "20% off select items",
                   actionText: "View items"),
        PromoCrad(text: "EGP 17 off with",
                  actionText: "Redeem"),
        PromoCrad(text: "Flat 15% off on all menu",
                   actionText: "More info"),
        PromoCrad(text: "EGP 17 off with",
                   actionText: "Redeem")
    ]
    
    init(){
        loadMockData()
    }
    
    init(restaurant: Restaurant,MenuItems: [MenuItem],restaurantImage:Image) {
        loadMockData()
        self.restaurant = restaurant
        self.menuItems = MenuItems
        self.restaurantImage = restaurantImage
    }
    
    func loadMockData() {
        restaurant = Restaurant(restaurantID: 12, name: "PlaceHolder", image: "", rating: 4,timeToDeliver: 22, deliveryFee: 30, haveDiscount: true, isFavorite: false)
        menuItems = [
            MenuItem(itemID: 1, itemName: "Pizza Margherita", itemDescription: "Fresh mozzarella, tomatoes, and basil leaves.", itemPrice: 40, restaurantID: 12, imageUrl: ""),
            MenuItem(itemID: 2, itemName: "Pizza Margherita", itemDescription: "Fresh mozzarella, tomatoes, and basil leaves.", itemPrice: 40, restaurantID: 12, imageUrl: ""),
            MenuItem(itemID: 3, itemName: "Pizza Margherita", itemDescription: "Fresh mozzarella, tomatoes, and basil leaves.", itemPrice: 40, restaurantID: 3, imageUrl: ""),
            MenuItem(itemID: 3, itemName: "Pizza Margherita", itemDescription: "Fresh mozzarella, tomatoes, and basil leaves.", itemPrice: 40, restaurantID: 12, imageUrl: ""),
        
        ]
    }
}

