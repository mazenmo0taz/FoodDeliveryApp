//
//  FoodDeliveryAppApp.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

@main
struct FoodDeliveryApp: App {
    @State private var cartViewModel: CartViewModel = CartViewModel(RestaurantDeliveryFee: 0)
    var body: some Scene {
        WindowGroup {
            FoodScreen()
                .environment(cartViewModel)
        }
    }
}
