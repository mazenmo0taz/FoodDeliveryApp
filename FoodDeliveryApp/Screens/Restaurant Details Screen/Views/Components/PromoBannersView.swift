//
//  PromosView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//

import SwiftUI

struct PromoBannersView: View {
    let viewModel:RestaurantDetailViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(viewModel.promosCrads){
                    
                }
                PromoCrad(text: "20% off select items", actionText: "View Items")
                PromoCrad(text: "EGP 30 off with rewards", actionText: "redeem")
            }
            .padding(.horizontal)
        }
    }
}

struct PromoCrad: View {
    let text: String
    let actionText: String
    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
            
            Spacer()
            HStack(spacing: 4) {
                Image(systemName: "ticket.fill")
                    .foregroundColor(.orange)
                Text(actionText)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .underline()
            }
        }
        .padding()
        .frame(width: 280, height: 60)
        .background(.brown.gradient.opacity(0.6))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
