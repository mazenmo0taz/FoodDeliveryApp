//
//  CartItem.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 24/11/2025.
//
import SwiftUI

struct CartItem: Identifiable {
    var id = UUID()
    var item: MenuItem
    var note: String?
    var quantity: Int
}
