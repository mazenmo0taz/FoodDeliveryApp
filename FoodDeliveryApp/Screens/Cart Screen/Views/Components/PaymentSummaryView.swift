//
//  PaymentSummaryView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 27/11/2025.
//

import Foundation
import SwiftUI
struct PaymentSummaryView: View {
    @Environment(CartViewModel.self) var cartViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Payment summary").font(.headline)
            HStack {
                Text("subtotal")
                Spacer()
                Text("\(cartViewModel.total)")
            }
            HStack {
                Text("Delivery fee")
                Spacer()
                Text("\(cartViewModel.RestaurantDeliveryFee)")
            }
            HStack {
                Text("Total amount").fontWeight(.bold)
                Spacer()
                Text("\(cartViewModel.RestaurantDeliveryFee + cartViewModel.total)").fontWeight(.bold)
            }
        }
        .padding(.vertical)
    }
}

