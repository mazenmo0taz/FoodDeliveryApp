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
                ForEach(viewModel.promosArray,id: \.self){ promo in
                    promo
                }
             
            }
            .padding(.horizontal)
            .padding(.vertical,5)
        }
    }
}

struct PromoCrad: View , Hashable {
    let text: String
    let actionText: String
    var body: some View {
        HStack {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .minimumScaleFactor(0.7)
            
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
