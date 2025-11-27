//
//  AllRestaurantsView.swift
//  FoodDeliveryApp
//
//  Created by Mazen Moataz on 16/11/2025.
//

import SwiftUI

struct RestaurantsListView: View {
    var viewModel:RestaurantsViewModel
    var body: some View {
        ForEach(viewModel.restaurants.isEmpty ? RestaurantMockData.restaurants : viewModel.filteredRestaurants ,id: \.self){ restaurant in
                NavigationLink(value: restaurant){
                    RestaurantCell(restaurant: restaurant, viewModel: viewModel)
                }
            }
            .redacted(reason: viewModel.isDataLoading ? .placeholder : [])
    }
    
}




