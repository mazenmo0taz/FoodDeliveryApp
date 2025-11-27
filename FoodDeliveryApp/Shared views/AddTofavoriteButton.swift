//
//  AddTofavoriteButton.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import SwiftUI

struct AddTofavoriteButton: View {
    var restaurant: Restaurant
    var action: () -> Void
    var body: some View {
        Button{
            action()
        }
        label: {
        Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
            .resizable()
            .frame(width:20, height:20)
            .background(Color.black.opacity(0.5).frame(width:16,height:16).clipShape(Circle()))
            .padding()
            .tint(.white)
            .bold()
        }
    }
}


