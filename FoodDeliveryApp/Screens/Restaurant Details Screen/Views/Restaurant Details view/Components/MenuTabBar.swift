//
//  MenuTabBar.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 19/11/2025.
//

import Foundation
import SwiftUI
struct MenuTabBar: View {
    var viewModel: RestaurantDetailViewModel
    let tabs = ["Order again", "Picks for you 🔥", "Offers", "Promotions","Sandwiches","Fries","Add-ons","Sauces"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(tabs, id: \.self) { tab in
                    VStack(spacing: 15) {
                        Text(tab)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(viewModel.selectedMenuTab == tab ? .primary : .secondary)
                        
                        Rectangle()
                        .fill(viewModel.selectedMenuTab == tab ? Color.primary : .clear)
                        .frame(height: 2)
                        .background(viewModel.selectedMenuTab == tab ? Color.primary : .clear)
                    }
                    .padding(.horizontal)
                    .onTapGesture {
                        viewModel.selectedMenuTab = tab
                    }
                }
            }
            .overlay(alignment: .bottom){
                Rectangle()
                    .fill(.tertiary)
                    .frame(height: 2)
            }
            
        }
    }
}
