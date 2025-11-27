//
//  CartItemsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI
struct CartItemsView: View {
    var items: [CartItem]
    var body: some View {
        VStack(spacing: 16) {
            ForEach(items){ item in
                CartItemCell(cartItem: item)
                Divider()
            }
           
        }.padding(.vertical)
    }
}
